
from odoo.tests.common import TransactionCase
from odoo.tests import tagged
from odoo.exceptions import AccessError

from pathlib import Path


@tagged('-at_install', 'post_install')
class TestOso(TransactionCase):

    def setUp(self, *args, **kwargs):
        super().setUp(*args, **kwargs)
        oso = self.env['oso'].oso
        oso.clear()
        mypath = Path(__file__).parent
        oso.load_file(mypath / "test_policy.polar")

        print("testing oso")

    def test_anything_works(self):
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
