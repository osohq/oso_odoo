"""Standardized tests for adapters based on the Post model.

Tests come from the relationship document & operations laid out there
https://www.notion.so/osohq/Relationships-621b884edbc6423f93d29e6066e58d16.
"""

from odoo.tests.common import TransactionCase
from odoo.tests import tagged
from odoo.exceptions import AccessError

from ..models.test import OsoTestModel

# Tags required so that classes are registered with oso before tests.
@tagged("-at_install", "post_install")
class TestOso(TransactionCase):
    def setUp(self, *args, **kwargs):
        super().setUp(*args, **kwargs)

        # Every user must have an associated partner.
        Partner = self.env["res.partner"]
        partner = Partner.create({"name": "Post test"})

        User = self.env["res.users"]

        def make_user(login):
            return User.create({"login": login, "partner_id": partner.id})

        foo = make_user("foo")
        admin_user = make_user("admin_user")  # moderator
        bad_user = make_user("bad_user")  # banned

        Post = self.env["oso.test_post.post"]

        def make_post(**kwargs):
            return Post.create(kwargs)

        self.posts = [
            make_post(
                contents="foo public post", access_level="public", created_by=foo.id
            ),
            make_post(
                contents="foo public post 2",
                access_level="public",
                created_by=foo.id,
            ),
            make_post(
                contents="foo private post",
                access_level="private",
                created_by=foo.id,
            ),
            make_post(
                contents="foo private post 2",
                access_level="private",
                created_by=foo.id,
            ),
            make_post(
                contents="private for moderation",
                access_level="private",
                needs_moderation=True,
                created_by=foo.id,
            ),
            make_post(
                contents="public for moderation",
                access_level="public",
                needs_moderation=True,
                created_by=foo.id,
            ),
            make_post(
                contents="admin post",
                access_level="public",
                needs_moderation=True,
                created_by=admin_user.id,
            ),
            make_post(
                contents="admin post",
                access_level="private",
                needs_moderation=True,
                created_by=admin_user.id,
            ),
            make_post(
                contents="banned post", access_level="public", created_by=bad_user.id
            ),
        ]

        # Tests will load their own rules.
        self.env["oso"].oso.clear_rules()

    def find_user(self, login):
        user = self.env["res.users"].search([("login", "=", login)])
        assert user, f"cannot find user {login}"
        return user

    def test_authorize_model_basic(self):
        """Test that a simple policy with checks on non-relationship attributes is correct."""

        oso = self.env["oso"]
        oso.oso.load_str(
            """
            allow_model(_user, _action, "oso.test_post.post");
            allow(user: res::users, "read", post: oso::test_post::post) if user.login = "foo" and post.access_level = "public";
            allow(user: res::users, "write", post: oso::test_post::post) if user.login = "foo" and post.access_level = "private";
            allow(user: res::users, "write", _post: oso::test_post::post) if user.login = "admin_user";
            allow(user: res::users, "read", post: oso::test_post::post) if
                user.login = "admin_user" and
                (post.access_level = "private" or post.access_level = "public") and
                post.needs_moderation = true;
            """
        )

        Post = self.env["oso.test_post.post"]

        # Reads are restricted by an attribute of the user.
        posts = Post.search([])
        self.assertEqual(len(posts), 9)
        self.assertEqual(posts[0].contents, "foo public post")

        # Admins can read anything that needs moderation.
        admin_user = self.find_user("admin_user")
        posts = Post.with_user(admin_user).search([])
        print(posts)
        self.assertEqual(
            [post.contents for post in posts],
            [
                "private for moderation",
                "public for moderation",
                "admin post",
                "admin post",
            ],
        )

        # Non-admin write access is restricted by an attribute of the resource.
        foo = self.find_user("foo")
        Post.with_user(foo).browse([post.id for post in self.posts]).write(
            {"contents": "written!"}
        )
        self.assertEqual(
            len([post for post in Post.search([]) if post.contents == "written!"]),
            4,
        )

        # Admins can write to anything.
        Post.with_user(admin_user).browse([post.id for post in self.posts]).write(
            {"contents": "written!"}
        )
        print(Post.search([]))
        self.assertEqual(
            len([post for post in Post.search([]) if post.contents == "written!"]),
            9,
        )

        # Unauthorized users can't read anything.
        demo = self.find_user("demo")
        self.assertFalse(Post.with_user(demo).search([]))

    def test_authorize_scalar_attribute_eq(self):
        """Test authorization rules on a relationship with one object equaling another."""
        oso = self.env["oso"]
        oso.oso.load_str(
            """
            allow_model(_user, _action, "oso.test_post.post");
            allow(actor: res::users, "read", post: oso::test_post::post) if
                post.created_by = actor and post.access_level = "private";
            allow(_actor: res::users, "read", post: oso::test_post::post) if
                post.access_level = "public";
            """
        )

        def allowed(post):
            return (
                post.access_level == "public"
                or post.access_level == "private"
                and post.created_by == foo
            )

        foo = self.find_user("foo")
        posts = self.env["oso.test_post.post"].with_user(foo).search([])
        self.assertEqual(len(posts), 8)
        self.assertTrue(all(allowed(post) for post in posts))


# def test_authorize_scalar_attribute_condition(session, oso, fixture_data):
#     """Scalar attribute condition checks."""
#     # Object equals another object

#     oso.load_str(
#         'allow(actor: User, "read", post: Post) if post.created_by.is_banned = false and '
#         'post.created_by.username = actor.username and post.access_level = "private";'
#     )

#     oso.load_str(
#         'allow(actor: User, "read", post: Post) if post.created_by.is_banned = false and '
#         'post.access_level = "public";'
#     )

#     # moderator can see posts made by banned users.
#     oso.load_str(
#         'allow(actor: User, "read", post: Post) if actor.is_moderator = true and post.created_by.is_banned = true;'
#     )

#     foo = session.query(User).filter(User.username == "foo").first()

#     posts = authorize_model(oso, foo, "read", session, Post)

#     def allowed(post, user):
#         return (
#             (post.access_level == "public" and post.created_by.is_banned == False)
#             or post.access_level == "private"
#             and post.created_by == user
#         )

#     assert posts.count() == 7
#     assert all(allowed(post, foo) for post in posts)

#     admin = session.query(User).filter(User.username == "admin_user").first()
#     posts = authorize_model(oso, admin, "read", session, Post)

#     def allowed_admin(post):
#         return post.created_by.is_banned

#     assert posts.count() == 6
#     for post in posts:
#         assert allowed(post, admin) or allowed_admin(post)


# @pytest.fixture
# def tag_test_fixture(session):
#     """Test data for tests with tags."""
#     user = User(username="user")
#     other_user = User(username="other_user")
#     moderator = User(username="moderator", is_moderator=True)

#     eng = Tag(name="eng")
#     random = Tag(name="random", is_public=True)

#     user_public_post = Post(
#         contents="public post", created_by=user, access_level="public"
#     )
#     user_private_post = Post(
#         contents="private user post", created_by=user, access_level="private"
#     )

#     other_user_public_post = Post(
#         contents="other user public", created_by=other_user, access_level="public"
#     )
#     other_user_private_post = Post(
#         contents="other user private", created_by=other_user, access_level="private"
#     )
#     other_user_random_post = Post(
#         contents="other user random",
#         created_by=other_user,
#         access_level="private",
#         tags=[random],
#     )

#     # HACK!
#     objects = {}
#     for (name, local) in locals().items():
#         if name != "session" and name != "objects":
#             session.add(local)

#         objects[name] = local

#     session.commit()

#     return objects


# def test_in_multiple_attribute_relationship(session, oso, tag_test_fixture):
#     oso.load_str(
#         """
#         allow(user, "read", post: Post) if post.access_level = "public";
#         allow(user, "read", post: Post) if post.access_level = "private" and post.created_by = user;
#         allow(user, "read", post: Post) if tag in post.tags and tag.is_public = true;
#     """
#     )

#     posts = authorize_model(oso, tag_test_fixture["user"], "read", session, Post)
#     print(str(posts.statement.compile()))
#     import pdb

#     pdb.set_trace()
#     assert tag_test_fixture["user_public_post"] in posts
#     assert tag_test_fixture["user_private_post"] in posts
#     assert not tag_test_fixture["other_user_public_post"] in posts
#     assert not tag_test_fixture["other_user_private_post"] in posts
#     assert tag_test_fixture["other_user_random_post"] in posts


# # TODO test non Eq conditions
# # TODO test f(x) if not x.boolean_attr;
