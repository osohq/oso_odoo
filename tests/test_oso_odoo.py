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
        oso = self.env["oso"].oso
        # oso.clear_rules()
        test_policy = get_resource_path("oso_odoo", "tests", "test_policy.polar")
        oso.load_file(test_policy)

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

    def test_filter(self):
        oso = self.env["oso"].oso

        repo_model = self.env["oso.test.repository"]
        repositories = repo_model.browse(repo_model._search([], access_rights_uid=1))
        query = oso.query_rule(
            "filter_allow",
            self.env.ref("base.user_demo"),
            "read",
            list(repositories),
            Variable("output"),
        )

        assert len(next(query)["bindings"]["output"]) == 2
