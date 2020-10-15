from odoo import models
from odoo.tests.common import TransactionCase
from odoo.tests import tagged
from odoo.exceptions import AccessError
from odoo.modules.module import get_resource_path

from ..models.test import OsoTestModel

from pathlib import Path

from oso import Variable

# Tags required so that classes are registered with oso before tests.
@tagged("-at_install", "post_install")
class TestOso(TransactionCase):
    def setUp(self, *args, **kwargs):
        super().setUp(*args, **kwargs)
        self.env["oso"].reload_policies()
        user_demo = self.env.ref("base.user_demo")
        self.env = self.env(user=user_demo)

    def test_model(self):
        good = self.env["oso.test.model"].create({"good": True})
        self.assertTrue(isinstance(good, OsoTestModel))
        good.read(["good"])
        with self.assertRaises(AccessError):
            good.write({})
        good.unlink()

        with self.assertRaises(AccessError):
            bad = self.env["oso.test.model"].create({"good": False})
