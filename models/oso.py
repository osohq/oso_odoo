# -*- coding: utf-8 -*-

from functools import wraps
from logging import getLogger
from os import listdir
from os.path import isfile
from pathlib import Path


from odoo import fields, models, api, tools
from odoo.exceptions import AccessError
from odoo.modules.module import get_resource_path

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
        # TODO: use get_modules to walk all modules as well
        policies = Path(get_resource_path("oso_odoo", "security", "base.polar")).parent

        def load_file(file):
            if isfile(file) and file.suffix == ".polar":
                try:
                    self.oso.load_file(file)
                except OsoError as e:
                    _logger.exception(e)
                    pass

        for f in listdir(policies):
            load_file(policies / f)

    def reload_policies(self):
        _logger.debug("Reloading policies")

    def is_allowed(self, actor, action, resource):
        return self.oso.is_allowed(actor, action, resource)


class IrModelAccess(models.Model):
    _inherit = "ir.model.access"

    def _check_model_access_by_name(self, operation, model_name):
        # Check for Odoo bypass rule
        odoo_result = super().check(model_name, operation, raise_exception=False)
        if odoo_result:
            return True

        # Check oso policy
        oso_result = self.env["oso"].is_allowed(self.env.user, operation, model_name)
        if oso_result:
            return True

        _logger.warning("Not authorized to {operation} on {model}")
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
        query = """SELECT 1 FROM oso_model_access o
                   JOIN ir_model m ON (m.id = o.checked)
                   WHERE m.model=%s"""
        self._cr.execute(query, (model_name,))
        return bool(self._cr.rowcount)


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
        elif self.env["oso"].is_allowed(self.env.user, operation, self):
            _logger.debug(f"{operation} is authorized on {self}")
            return None
        else:
            raise AccessError(f"{operation} is not authorized on {self}")

    def _register_hook(self):
        # Rewrite model name for Polar compatibility.
        name = self._name.replace(".", "::")
        oso = self.env["oso"].oso
        oso.register_class(type(self), name=name)
        _logger.debug(f"registered class {name}")

    # def authorize(action):
    #     def wrap(function):
    #         @wraps(function)
    #         def wrapper(self, *args, **kwargs):
    #             if not self.env["oso.model.access"].is_checked(self._name):
    #                 return super().check_access_rule(operation)
    #             self.check_access_rights("read")

    #             _logger.debug(f"Filtering {action} on {self}")
    #             # Odoo will filter transient data whose create_uid != self._uid.
    #             results = function(self, *args, **kwargs)
    #             _logger.debug(f"Prefiltered {results}")

    #             if self.env.su or self._transient:
    #                 return results

    #             user = self.env.user

    #             # sometimes Odoo returns a list as the result type
    #             allow_filter = lambda record: self.env["oso"].is_allowed(
    #                 user, action, record
    #             )
    #             if isinstance(results, models.AbstractModel):
    #                 results = results.filtered(allow_filter)
    #                 _logger.debug(f"Filtered: {results}")
    #             elif isinstance(results, list):
    #                 pass
    #             else:
    #                 _logger.warning(
    #                     f"filtering something which isn't a list nor a model: {results}"
    #                 )
    #             return results

    #         return wrapper

    #     return wrap

    # @authorize("read")
    # def read(self, *args, **kwargs):
    #     return super().read(*args, **kwargs)

    # @authorize("read")
    # def search(self, *args, **kwargs):
    #     return super().search(*args, **kwargs)


class OsoTestModel(models.Model):
    _name = "oso.test.model"
    _description = "Model for testing oso"

    good = fields.Boolean()
