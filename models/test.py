from functools import wraps
from logging import getLogger
from os import listdir, walk
from os.path import isfile
from pathlib import Path


from odoo import fields, models
from odoo.exceptions import AccessError


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
