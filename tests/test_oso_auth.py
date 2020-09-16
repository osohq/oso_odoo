from odoo.tests.common import TransactionCase
from odoo.tests import tagged
from odoo.exceptions import AccessError

from pathlib import Path

# Tags required so that classes are registered with oso before tests.
@tagged("-at_install", "post_install")
class TestOso(TransactionCase):
    def setUp(self, *args, **kwargs):
        super().setUp(*args, **kwargs)
        oso = self.env["oso"].oso
        oso.clear()
        mypath = Path(__file__).parent
        oso.load_file(mypath / "test_policy.polar")

        user_demo = self.env.ref("base.user_demo")
        self.env = self.env(user=user_demo)

    def test_record_access(self):
        qweb = self.env["ir.qweb"]
        qweb.read()
        with self.assertRaises(AccessError):
            qweb.create({})
        with self.assertRaises(AccessError):
            qweb.write({})

        mail_server = self.env["ir.mail_server"].create(
            {"name": "mail", "smtp_host": "smtp.example.org"}
        )
        with self.assertRaises(AccessError):
            mail_server.read()
        mail_server.unlink()

    def test_model_access(self):
        with self.assertRaises(AccessError):
            self.env["ir.ui.menu"].create({"name": "menu"})
