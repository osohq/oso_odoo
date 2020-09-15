# -*- coding: utf-8 -*-

from odoo import models
from oso import Oso, OsoException

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
        # Get name of original model class
        name = type(self).__bases__[0].__name__
        oso.register_class(type(self), name=name)


