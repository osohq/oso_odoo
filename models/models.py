# -*- coding: utf-8 -*-

from odoo import models
from odoo.exceptions import AccessError

from oso import Oso, OsoException

from pathlib import Path

class Oso(models.AbstractModel):
    _name = "oso"
    _description = "global oso state"

    # we know this is a singleton because we checked
    oso = Oso()

    def _register_hook(self):
        mypath = Path(__file__).parent.parent
        self.oso.load_file(mypath / "security" / "authorization.polar")

class Base(models.AbstractModel):

    _inherit = 'base'

    def read(self, fields=None, load='_classic_read'):
        oso = self.env['oso'].oso
        if oso.is_allowed(self.env.user, "read", self):
            return super().read(fields, load=load)
        else:
            raise AccessError("Not authorized by oso")



    def _register_hook(self):
        # Get name of original model class
        name = self._name.replace(".", "::")
        oso = self.env['oso'].oso
        oso.register_class(type(self), name=name)


