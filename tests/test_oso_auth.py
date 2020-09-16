
from odoo.tests.common import TransactionCase
from odoo.tests import tagged
from odoo.exceptions import AccessError

from pathlib import Path


# required so that classes are registered with oso before tests
@tagged('-at_install', 'post_install')
class TestOso(TransactionCase):

    def setUp(self, *args, **kwargs):
        super().setUp(*args, **kwargs)
        oso = self.env['oso'].oso
        oso.clear()
        mypath = Path(__file__).parent
        oso.load_file(mypath / "test_policy.polar")

        # failing to find user_demo because tests are running post_install
        # demo user needed to avoid superuser case
        user_demo = self.env.ref('base.user_demo')
        self.env = self.env(user=user_demo)

        print("testing oso")

    def _test_record_access(self):
        message = self.env['mail.message']

        with self.assertRaises(AccessError):
            message.read()

        with self.assertRaises(AccessError):
            message.create({})

        with self.assertRaises(AccessError):
            message.write({})

        model = self.env['sms.sms'].create({})
        with self.assertRaises(AccessError):
            model.unlink()

    def test_model_access(self):
        # failing because uses superuser, why we need to get demo user working
        with self.assertRaises(AccessError):
            website = self.env['ir.ui.menu'].create({"name": "menu"})
