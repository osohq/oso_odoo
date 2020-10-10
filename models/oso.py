# -*- coding: utf-8 -*-

from functools import wraps
from logging import getLogger
from os import listdir, walk
from os.path import isfile
from pathlib import Path


from odoo import fields, models, api, tools
from odoo.exceptions import AccessError
from odoo.modules import get_modules, get_resource_path

import polar
from polar import Polar
from oso import Oso, OsoError


_logger = getLogger(__name__)


class Oso(models.AbstractModel):
    _name = "oso"
    _description = "oso authorization engine and global state"
    oso = Oso()

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.load_policies()

    def load_policies(self):
        """Walks all modules and loads and .polar policy files found"""

        def load_file(file):
            if isfile(file) and file.suffix == ".polar":
                try:
                    _logger.debug(f"Loading policy file: {file}")
                    self.oso.load_file(file)
                except polar.exceptions.FileLoadingError as e:
                    _logger.debug(e)
                    pass

        _logger.debug(f"Got modules: {get_modules()}")
        for module in get_modules():
            policy_dir = get_resource_path(module, "policy")

            if policy_dir:
                for root, dirs, files in walk(policy_dir):
                    for f in files:
                        _logger.debug(f"Load file: {Path(root) / f}")
                        load_file(Path(root) / f)

    def reload_policies(self):
        # TODO: replace with clear_rules once stabilised
        _logger.info("Reloading policies")
        polar = Polar()
        classes = {
            k: v
            for k, v in self.oso.host.classes.items()
            if k not in polar.host.classes
        }
        constructors = {
            k: v
            for k, v in self.oso.host.constructors.items()
            if k not in polar.host.constructors
        }

        polar = Polar(
            classes=classes,
            constructors=constructors,
        )
        self.oso.host = polar.host
        self.oso.ffi_polar = polar.ffi_polar
        self.env["ir.rule"].clear_caches()
        self.env["ir.model.access"].clear_caches()
        self.load_policies()

    def authorize(self, user, action, resource):
        self.oso.register_constant("env", self.env)
        self.oso.register_constant("context", dict(self._context))
        return self.oso.is_allowed(user, action, resource)


class IrModelAccess(models.Model):
    _inherit = "ir.model.access"

    def _check_model_access_by_name(self, operation, model_name):
        # Check for Odoo bypass rule
        odoo_result = super().check(model_name, operation, raise_exception=False)
        if odoo_result:
            return True

        # Check oso policy
        oso_result = self.env["oso"].authorize(self.env.user, operation, model_name)
        if oso_result:
            return True

        _logger.warning(f"Not authorized to {operation} on {model_name}")
        return False

    @api.model
    @tools.ormcache_context(
        "self._uid", "model", "mode", "raise_exception", keys=("lang",)
    )
    def check(self, model, mode="read", raise_exception=True):
        assert isinstance(model, str), "check model takes a model name"
        res = self._check_model_access_by_name(mode, model)
        if not res and raise_exception:
            raise AccessError(f"{self.env.user} does not have {mode} rights on {model}")
        else:
            _logger.debug(f'{mode} is {"" if res else "not "}authorized on {model}')
            return res


class OsoModelAccess(models.Model):
    _name = "oso.model.access"
    _description = "selectively enable access control with oso"

    checked = fields.Many2one(
        "ir.model",
        string="Object",
        required=True,
        domain=[("transient", "=", False)],
        index=True,
        ondelete="cascade",
    )

    def is_checked(self, model_name):
        # TODO: This should really be cached
        query = """SELECT 1 FROM oso_model_access o
                   JOIN ir_model m ON (m.id = o.checked)
                   WHERE m.model=%s"""
        self._cr.execute(query, (model_name,))
        return bool(self._cr.rowcount)


# Decorator used to wrap base models
def authorize(action):
    def wrap(function):
        @wraps(function)
        def wrapper(self, *args, **kwargs):
            self.check_access_rights("read")
            results = self
            if not self.env.su and self.env["oso.model.access"].is_checked(self._name):
                _logger.info(f"Authorizing {action} on {results}")
                allow_filter = lambda record: self.env["oso"].authorize(
                    self.env.user, action, record.sudo()
                )
                results = results.filtered(allow_filter)

            results = function(results, *args, **kwargs)

            return results

        return wrapper

    return wrap


class OsoBase(models.AbstractModel):
    _inherit = "base"
    _description = "model- and record-level access control with oso"

    # oso_perm_read = fields.Boolean(
    #     "oso read permission",
    #     default=True,
    #     compute="_compute_read_perm",
    #     readonly=True,
    #     search="_search_read_perm",
    # )

    # @api.model
    # def _search_read_perm(self, operator, value):
    #     recs = self.search([]).filtered(lambda x: x.oso_perm_read is True)
    #     if recs:
    #         return [("id", "in", [x.id for x in recs])]

    # @api.model
    # @api.depends_context("uid", "oso")
    # def _compute_read_perm(self):
    #     if self.env["oso.model.access"].is_checked(self._name):
    #         for record in self:
    #             try:
    #                 record.oso_perm_read = self.env["oso"].authorize(
    #                     self.env.user, "read", record
    #                 )
    #             except Exception:
    #                 pass

    @api.model
    def check_access_rights(self, operation, raise_exception=True):
        """Verifies that the model-level operation is allowed for
        the current user according to the current oso policy.
        """
        return self.env["ir.model.access"].check(self._name, operation, raise_exception)

    def check_access_rule(self, operation):
        """If access control with oso is enabled for the model,
        verifies that the record-level operation is allowed for
        the current user according to the oso policy. Otherwise,
        defaults to the Odoo ir.rules mechanism.

        :param operation: one of ``read``, ``write``, ``create``, or ``unlink``.
        :raise AccessError: if the policy does not permit this operation.
        :return: None if the operation is allowed.
        """
        if not self.env["oso.model.access"].is_checked(self._name):
            return super().check_access_rule(operation)
        elif self.env.su:
            return None
        elif self.env["oso"].authorize(self.env.user, operation, self):
            _logger.debug(f"{operation} is authorized on {self}")
            return None
        else:
            raise AccessError(f"{operation} is not authorized on {self}")

    def _register_hook(self):
        # Rewrite model name for Polar compatibility.
        name = self._name.replace(".", "::")
        oso = self.env["oso"].oso
        try:
            oso.register_class(type(self), name=name)
            _logger.debug(f"registered class {name}")
        except polar.exceptions.DuplicateClassAliasError as e:
            _logger.debug(f"class {name} already registered")

    # def _filter_authorized(self):
    #     results = self
    #     if not self.env.su and self.env["oso.model.access"].is_checked(self._name):
    #         if not results.ids:
    #             import pdb

    #             pdb.set_trace()
    #         _logger.info(f"Authorizing read on {results}")
    #         allow_filter = lambda record: self.env["oso"].authorize(
    #             self.env.user, "read", record.sudo()
    #         )
    #         results = results.filtered(allow_filter)
    #     return results

    @authorize("read")
    def read(self, *args, **kwargs):
        return super().read(*args, **kwargs)

    @authorize("read")
    def search(self, *args, **kwargs):
        return super().search(*args, **kwargs)

    # def read(self, *args, **kwargs):
    #     self.check_access_rights("read")
    #     results = self._filter_authorized()
    #     return super(OsoBase, results).read(*args, **kwargs)

    # def _search(self, arg, *other_args, **kwargs):
    #     if not self.env.su and self.env["oso.model.access"].is_checked(self._name):
    #         # Get all IDs and filter down to just the authorized ones
    #         filtered_ids = self.browse(super(OsoBase, self)._search([]))._filter_authorized().ids
    #         # add it as a search filter
    #         arg += [("id", "in", filtered_ids)]
    #     results = super()._search(arg, *other_args, **kwargs)
    #     return results
