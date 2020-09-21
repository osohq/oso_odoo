# -*- coding: utf-8 -*-

from functools import wraps
from logging import getLogger
from pathlib import Path

from odoo import fields, models, api, tools
from odoo.exceptions import AccessError
from odoo.modules.module import get_resource_path

from oso import Oso, OsoException


_logger = getLogger(__name__)


class Oso(models.AbstractModel):
    _name = "oso"
    _description = "global oso state"
    oso = Oso()

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        policy = get_resource_path("oso_auth", "security", "base.polar")
        try:
            self.oso.load_file(policy)
        except OsoException as e:
            _logger.exception(e)
            pass


class OsoBase(models.AbstractModel):
    _inherit = "base"

    @api.model
    def check_access_rights(self, operation, raise_exception=True):
        """ Verifies that the operation given by ``operation`` is allowed for
            the current user according to the access rights.
        """

        # Check for Odoo bypass rule
        odoo_result = super().check_access_rights(operation, raise_exception=False)
        if odoo_result:
            return True

        # Check oso
        oso = self.env["oso"].oso
        oso_result = oso.is_allowed(self.env.user, operation, self._name)
        if oso_result:
            return True

        # finally, return False or create Odoo exception
        # Alternatively: we could throw the exception
        return super().check_access_rights(
            operation, raise_exception=raise_exception)

    def check_access_rule(self, operation):
        """ Verifies that the operation given by ``operation`` is allowed for
            the current user according to ir.rules.

           :param operation: one of ``write``, ``unlink``
           :raise UserError: * if current ir.rules do not permit this operation.
           :return: None if the operation is allowed
        """
        oso = self.env["oso"].oso
        if oso.is_allowed(self.env.user, operation, self):
            _logger.debug(f"{operation} is authorized on {self}")
            return None
        else:
            raise AccessError(f"{operation} is not authorized on {self}")

    def authorize(action):
        def wrap(function):
            @wraps(function)
            def wrapper(self, *args, **kwargs):
                # Odoo will filter transient data whose create_uid != self._uid.
                results = function(self, *args, **kwargs)
                if self.env.su or self._transient:
                    return results

                oso = self.env["oso"].oso
                user = self.env.user

                # sometimes Odoo returns a list as the result type
                allow_filter = lambda record: oso.is_allowed(user, action, record)
                if isinstance(results, models.AbstractModel):
                    return results.filtered(allow_filter)
                elif isinstance(results, list):
                    return list(filter(allow_filter, results))
                else:
                    _logger.warning(f"filtering something which isn't a list nor a model: {results}")
                    return results

            return wrapper
        return wrap

    @authorize("read")
    def read(self, *args, **kwargs):
        return super().read(*args, **kwargs)

    @authorize("read")
    def search(self, *args, **kwargs):
        return super().search(*args, **kwargs)

    def _register_hook(self):
        # Rewrite model name for Polar compatibility.
        name = self._name.replace(".", "::")
        oso = self.env["oso"].oso
        oso.register_class(type(self), name=name)
        _logger.debug(f"{name} is registered")


class TestModel(models.Model):
    _name = "test.model"
    _description = "Model for testing"

    good = fields.Boolean()