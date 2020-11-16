"""Models for standardized adapter tests based on the Post model:
https://www.notion.so/osohq/Relationships-621b884edbc6423f93d29e6066e58d16.
"""

from odoo import fields, models


class Tag(models.Model):
    _name = "oso.test_post.tag"

    name = fields.Char()

    # If provided, posts in this tag always have the public access level.
    is_public = fields.Boolean(default=False)


class Post(models.Model):
    _name = "oso.test_post.post"

    contents = fields.Char()
    access_level = fields.Selection(
        selection=[("public", "Public"), ("private", "Private")], required=True
    )
    created_by = fields.Many2one("res.users", required=True)
    needs_moderation = fields.Boolean(default=False, required=True)
    tags = fields.Many2many("oso.test_post.tag")


class User(models.Model):
    _inherit = "res.users"

    is_moderator = fields.Boolean(default=False)
    is_banned = fields.Boolean(default=False)


# Q(ap): What are these for?
# Single tag
# tag = relationship("Tag")
# tag_name = Column(Integer, ForeignKey("tags.name"))

# Many tags
# tags = relationship("Tag", secondary=user_tags)
