# -*- coding: utf-8 -*-

from functools import wraps
from logging import getLogger
from os import listdir, walk
from os.path import isfile
from pathlib import Path


from odoo import fields, models, api, tools
from odoo.exceptions import AccessError
from odoo.modules import get_modules, get_resource_path
from odoo.osv import expression as domain_expression
from odoo.models import BaseModel

from oso import Oso, OsoError
from polar import Polar
from polar.exceptions import DuplicateClassAliasError, FileLoadingError
from polar.partial import Partial, TypeConstraint

from .partial import partial_to_domain_expr, polar_type_name

_logger = getLogger(__name__)


class Oso(models.AbstractModel):
    _name = "oso"
    _description = "oso authorization engine and global state"
    oso = Oso()

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def load_policies(self):
        """Walks all modules and loads and .polar policy files found"""

        def load_file(file):
            if isfile(file) and file.suffix == ".polar":
                try:
                    _logger.debug(f"Loading policy file: {file}")
                    self.oso.load_file(file)
                except FileLoadingError as e:
                    _logger.debug(e)
                    pass
            else:
                _logger.warning(f"Not a valid policy file: {file}")

        _logger.debug(f"Got modules: {get_modules()}")
        for module in get_modules():
            policy_dir = get_resource_path(module, "policy")

            if policy_dir:
                for root, dirs, files in walk(policy_dir):
                    for f in files:
                        _logger.debug(f"Load file: {Path(root) / f}")
                        load_file(Path(root) / f)

        for policy in self.env["oso.policy"].search([]):
            (module, *segments) = policy.path.split("/")
            path = Path(get_resource_path(module, *segments))
            _logger.info(f"Load custom policy: {path}")
            load_file(path)

    def _register_hook(self):
        self.reload_policies()
        super()._register_hook()

    def reload_policies(self):
        _logger.info("Reloading policies")
        self.oso.clear_rules()
        self.env["ir.rule"].clear_caches()
        self.env["ir.model.access"].call_cache_clearing_methods()
        self.env["ir.model.access"].clear_caches()
        self.load_policies()

    def authorize(self, user, action, resource):
        self.oso.register_constant(
            self.env,
            "env",
        )
        self.oso.register_constant(dict(self._context), "context")

        assert isinstance(resource, BaseModel), "expected a model"
        type_name = polar_type_name(resource._name)
        partial_resource = Partial("resource", TypeConstraint(type_name))
        results = self.oso.query_rule("allow", user, action, partial_resource)

        domain = []
        for result in results:
            resource_partial = result["bindings"]["resource"]
            expr = partial_to_domain_expr(resource_partial, resource)
            if domain:
                domain = domain_expression.OR([domain, expr])
            else:
                domain = expr
        if domain == []:
            domain = domain_expression.FALSE_DOMAIN
        return domain


class OsoUser(models.AbstractModel):
    _inherit = "res.users"

    def _register_hook(self):
        OsoBase._register_hook(self)

    def _group_names(self):
        """Get all user groups as a list of XML string names"""
        return list(self.groups_id.get_xml_id().values())


class IrModelAccess(models.Model):
    _name = "ir.model.access"
    _inherit = "ir.model.access"
    _description = "oso replacement for ir.model.access"

    def _check_model_access_by_name(self, operation, model_name):
        # Check for Odoo bypass rule.
        if super().check(model_name, operation, raise_exception=False):
            return True

        # Check oso policy.
        try:
            next(
                self.env["oso"].oso.query_rule(
                    "allow_model", self.env.user, operation, model_name
                )
            )
            return True
        except StopIteration:
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


class OsoPolicy(models.Model):
    _name = "oso.policy"
    _description = "add additional custom policies"

    path = fields.Char(string="Path")


class OsoBase(models.AbstractModel):
    _inherit = "base"
    _description = "model- and record-level access control with oso"

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

        domain = self.env["oso"].authorize(self.env.user, operation, self)
        results = self.filtered_domain(domain)
        if results:
            _logger.debug(f"{operation} is authorized on {self}")
            return None
        else:
            raise AccessError(f"{operation} is not authorized on {self}")

    def _register_hook(self):
        super()._register_hook()

        # Rewrite model name for Polar compatibility.
        name = polar_type_name(self._name)
        oso = self.env["oso"].oso
        try:
            oso.register_class(type(self), name=name)
            _logger.debug(f"registered class {name}")
        except DuplicateClassAliasError as e:
            _logger.debug(f"class {name} already registered")

    def _filter_authorized(self, operation):
        results = self
        if not self.env.su and self.env["oso.model.access"].is_checked(self._name):
            _logger.info(f"Authorizing read on {results}")
            domain = self.env["oso"].authorize(self.env.user, operation, self)
            results = results.filtered_domain(domain)
        return results

    def read(self, *args, **kwargs):
        self.check_access_rights("read")
        results = self._filter_authorized("read")
        if self and not results:
            raise AccessError(f"read is not authorized on {self}")
        return super(OsoBase, results).read(*args, **kwargs)

    def write(self, vals):
        results = self._filter_authorized("write")
        if self and not results:
            raise AccessError(f"write is not authorized on {self}")
        return super(OsoBase, results).write(vals)

    def _search(self, domain, *args, access_rights_uid=None, **kwargs):
        if (
            access_rights_uid != 1
            and not self.env.su
            and self.env["oso.model.access"].is_checked(self._name)
        ):
            domain += self.env["oso"].authorize(self.env.user, "read", self)
        return super()._search(domain, *args, **kwargs)
