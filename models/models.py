# -*- coding: utf-8 -*-

from odoo import models
from oso import Oso

from pathlib import Path

oso = Oso()
mypath = Path(__file__).parent.parent
oso.load_file(mypath / "security" / "authorization.polar")

class Base(models.AbstractModel):

    _inherit = 'base'

    def read(self, fields=None, load='_classic_read'):
        if oso.is_allowed(self.env.user, "read", self):
            print("allowed!")
        else:
            print("denied!")
        return super(Base, self).read(fields, load=load)


    def _register_hook(self):
        with open("/tmp/odoo_models", "a") as f:
            print(self._name, file=f)

        oso.register_class(type(self))
