# -*- coding: utf-8 -*-

from functools import wraps
from logging import getLogger
from pathlib import Path

from odoo import fields, models, api
from odoo.exceptions import AccessError
from odoo.modules.module import get_resource_path

from oso import Oso


_logger = getLogger(__name__)


class Oso(models.Model):
    _name = "oso"
    _description = "global oso state"
    oso = Oso()

    checked = fields.Many2one('ir.model', string='Object', required=True, domain=[('transient', '=', False)], index=True, ondelete='cascade')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        policy = get_resource_path("oso_odoo", "security", "base.polar")
        self.oso.load_file(policy)

    def is_allowed(self, actor, action, resource):
        return self.oso.is_allowed(actor, action, resource)

    def is_checked(self, model_name):
        query = """SELECT 1 FROM oso
                   JOIN ir_model ON (ir_model.id = oso.checked)
                   WHERE ir_model.model=%s"""
        self._cr.execute(query, (model_name,))
        return bool(self._cr.rowcount)

class OsoBase(models.AbstractModel):
    _inherit = "base"
    _description = "Model- and record-level access control with oso"

    @api.model
    def check_access_rights(self, operation, raise_exception=True):
        """Verifies that the operation given by ``operation`` is allowed
           for the current user according to the current oso policy.
        """

        # Check for Odoo bypass rule.
        odoo_result = super().check_access_rights(operation, raise_exception=False)
        if odoo_result:
            return True

        # Check oso.
        oso = self.env["oso"].oso
        oso_result = oso.is_allowed(self.env.user, operation, self._name)
        if oso_result:
            return True

        if raise_exception:
            raise AccessError(f"{self.env.user} does not have {operation} rights on {self}")
        else:
            return False

    def check_access_rule(self, operation):
        """Verifies that the record-level operation given by ``operation``
           is allowed for the current user according to the oso policy,
           if record-level checks are enabled for this model.

           :param operation: one of ``read``, ``write``, ``create``, or ``unlink``.
           :raise AccessError: if the policy does not permit this operation.
           :return: None if the operation is allowed.
        """
        oso = self.env["oso"]
        if not oso.is_checked(self._name):
            return super().check_access_rule(operation)
        elif oso.is_allowed(self.env.user, operation, self):
            _logger.debug(f"{operation} is authorized on {self}")
            return None
        else:
            raise AccessError(f"{operation} is not authorized on {self}")

    def _register_hook(self):
        # Rewrite model name for Polar compatibility.
        name = self._name.replace(".", "::")
        oso = self.env["oso"].oso
        oso.register_class(type(self), name=name)
        _logger.debug(f"{name} is registered")


class OsoTestModel(models.Model):
    _name = "oso.test.model"
    _description = "Model for testing oso"

    good = fields.Boolean()
