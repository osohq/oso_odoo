from odoo.tests.common import TransactionCase
from odoo.tests import tagged
from odoo.exceptions import AccessError

from ..models.test import OsoTestModel

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

    def test_partial_disjunctive_matches(self):
        self.env["oso"].oso.load_str(
            """
                allow_model(_, _, "oso.test.foo");
                allow(_, "create", _: oso::test::foo);

                allow(_, _, bar: oso::test::bar) if check_foo(bar.foo);
                check_foo(foo: oso::test::baz) if foo.name = "y";
                check_foo(foo: oso::test::foo) if foo.name = "x";
            """
        )

        x = self.env["oso.test.foo"].create({"name": "x", "bars": []})
        bar = self.env["oso.test.bar"].create({"name": "bar1"})

        filter = self.env["oso"].authorize("a", "b", bar)
        self.assertEqual(filter, [("foo.name", "=", "x")])

    def test_null_with_partial(self):
        oso = self.env["oso"]
        foo = self.env["oso.test.foo"]
        oso.oso.clear_rules()
        oso.oso.load_str(
            """
                allow_model(_, _, "oso.test.foo");
                allow(_, action, _: oso::test::foo) if action in ["create", "read"];
                allow(_, "unlink", foo: oso::test::foo) if foo.name = nil;
            """
        )

        null_foo = foo.create({"name": None})
        breakpoint()
        filter = oso.authorize("a", "unlink", null_foo)
        # TODO(gj): update the below to False after registering nil as False in Odooland.
        self.assertEqual(filter, [("name", "=", None)])
        null_foo.unlink()

        non_null_foo = foo.create({})
        with self.assertRaises(AccessError):
            non_null_foo.unlink()
