from odoo import fields, models


class OsoTestModel(models.Model):
    _name = "oso.test.model"
    _description = "Model for testing oso"

    good = fields.Boolean()


class Organization(models.Model):
    _name = "oso.test.organization"
    _description = "Model for testing oso"

    name = fields.Char(string="Name")
    repositories = fields.One2many(
        "oso.test.repository", "organization", string="Repositories"
    )


class Repository(models.Model):
    _name = "oso.test.repository"
    _description = "Model for testing oso"

    name = fields.Char(string="Name")
    organization = fields.Many2one(
        "oso.test.organization", ondelete="cascade", string="Organization"
    )


class Foo(models.Model):
    _name = "oso.test.foo"
    _description = "Model for testing oso"

    name = fields.Char(string="Name")
    bars = fields.One2many("oso.test.bar", "foo", string="Bars")


class Bar(models.Model):
    _name = "oso.test.bar"
    _description = "Model for testing oso"

    name = fields.Char(string="Name")
    foo = fields.Many2one("oso.test.foo", ondelete="cascade", string="Foo")


class Baz(models.Model):
    _name = "oso.test.baz"
    _description = "Model for testing oso"

    name = fields.Char(string="Name")
