# -*- coding: utf-8 -*-

from functools import wraps
from logging import getLogger
from os import listdir
from os.path import isfile
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

        try:
            self.load_policies()
        except OsoException as e:
            _logger.exception(e)
            pass

    def load_policies(self):
        # self.oso.clear_rules()
        # self.host = self.oso.host
        # self.ffi_polar = self.oso.ffi_polar
        policies = Path(get_resource_path("oso-odoo", "security", "base.polar")).parent
        def load_file(file):
            if isfile(file) and file.suffix == ".polar":
                self.oso.load_file(file)
        for f in listdir(policies):
            load_file(policies / f)
        for f in listdir(policies / "models"):
            load_file(policies / "models" / f)
        for f in listdir(policies / "views"):
            load_file(policies / "views" / f)



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
        _logger.info(f"Authorizing: {operation} on {self}")
        if self.env.su or self._transient:
            _logger.info(f"{operation} is authorized on {self} via sudo")
            return None

        sudo_self = self.sudo()
        oso = self.env["oso"].oso
        resource_list = list(sudo_self)
        # filtered = oso.query_rule("filter_allow", sudo_self.env.user, operation, resource_list, oso.Variable("filtered"))
        if oso.is_allowed(sudo_self.env.user, operation, sudo_self):
            _logger.info(f"{operation} is authorized on {self}")
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
                _logger.info(f"Filtering {action} on {results}")
                # if isinstance(results, dict) or isinstance(results, list) and isinstance(results[0], dict):
                #     import pdb; pdb.set_trace()
                if isinstance(results, models.AbstractModel):
                    results = results.filtered(allow_filter)
                elif isinstance(results, list):
                    # results = list(filter(allow_filter, results))
                    # lets not filter these
                    pass
                else:
                    _logger.warning(f"filtering something which isn't a list nor a model: {results}")
                _logger.info(f"Filtered: {results}")
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
        _logger.info(f"{name} is registered")


class TestModel(models.Model):
    _name = "test.model"
    _description = "Model for testing"

    good = fields.Boolean()