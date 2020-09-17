# -*- coding: utf-8 -*-

from odoo import models, api, tools
from odoo.exceptions import AccessError
from odoo.modules.module import get_resource_path

from oso import Oso, OsoException

from pathlib import Path


class Oso(models.AbstractModel):
    _name = "oso"
    _description = "global oso state"
    oso = Oso()

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        for policy in Path(get_resource_path("oso_auth", "security")).glob("*.polar"):
            self.oso.load_file(str(policy))


class OsoBase(models.AbstractModel):
    _inherit = "base"

    def create(self, *args, **kwargs):
        oso = self.env["oso"].oso
        if oso.is_allowed(self.env.user, "create", self):
            return super().create(*args, **kwargs)
        else:
            raise AccessError("create not authorized by oso")

    def read(self, *args, **kwargs):
        oso = self.env["oso"].oso
        if oso.is_allowed(self.env.user, "read", self):
            return super().read(*args, **kwargs)
        else:
            raise AccessError("read not authorized by oso")

    def write(self, *args, **kwargs):
        oso = self.env["oso"].oso
        if oso.is_allowed(self.env.user, "write", self):
            return super().write(*args, **kwargs)
        else:
            raise AccessError("write not authorized by oso")

    def unlink(self, *args, **kwargs):
        oso = self.env["oso"].oso
        if oso.is_allowed(self.env.user, "unlink", self):
            return super().unlink(*args, **kwargs)
        else:
            raise AccessError("unlink not authorized by oso")

    def _register_hook(self):
        # Rewrite model name for Polar compatibility.
        name = self._name.replace(".", "::")
        oso = self.env["oso"].oso
        oso.register_class(type(self), name=name)


class OsoModelAccess(models.Model):
    _inherit = "ir.model.access"

    @api.model
    @tools.ormcache_context(
        "self._uid", "model", "mode", "raise_exception", keys=("lang",)
    )
    def check(self, model, mode="read", raise_exception=True):
        if self.env.su:
            return True
        oso = self.env["oso"].oso
        if oso.is_allowed(self.env.user, mode, model):
            return True
        elif raise_exception:
            raise AccessError(f"model access check failed for {model}")
        else:
            # for now, fall back to default odoo authorization if oso auth fails
            return super().check(model, mode=mode, raise_exception=raise_exception)
