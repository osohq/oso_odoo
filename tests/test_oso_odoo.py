from odoo import models
from odoo.tests.common import TransactionCase
from odoo.tests import tagged
from odoo.exceptions import AccessError
from odoo.modules.module import get_resource_path

from pathlib import Path


# Tags required so that classes are registered with oso before tests.
@tagged("-at_install", "post_install")
class TestOso(TransactionCase):
    def setUp(self, *args, **kwargs):
        super().setUp(*args, **kwargs)
        oso = self.env["oso"].oso
        oso.clear_rules()
        test_policy = get_resource_path("oso_odoo", "tests", "test_policy.polar")
        oso.load_file(test_policy)

        user_demo = self.env.ref("base.user_demo")
        self.env = self.env(user=user_demo)

    def test_model(self):
        good = self.env["test.model"].create({"good": True})
        good.read()
        bad = self.env["test.model"].create({"good": False})
        self.assertFalse(bad.read()._ids)

    def test_record_access(self):
        # negative test
        bad_mail_server = self.env["ir.mail_server"].create(
            {"name": "evil_mail", "smtp_host": "smtp.evil.org"}
        )
        self.assertFalse(bad_mail_server.read()._ids)
        bad_mail_server.unlink()

        # positive test
        mail_server = self.env["ir.mail_server"].create(
            {"name": "mail", "smtp_host": "smtp.example.org"}
        )
        mail_server.read()
        mail_server.write({})
        mail_server.unlink()

    def test_model_access(self):
        image = self.env["res.country"].create({"name": "osoland"})
        image.read()
        with self.assertRaises(AccessError):
            image.write({})
        image.unlink()

    def test_group_lookup(self):
        # this hits the `role()` rule in the policy, which looks up a group on a user
        menu = self.env["ir.ui.menu"].create({"name": "menu"})
        menu.unlink()

        group = self.env["res.groups"]
        self.assertFalse(group.read()._ids)
