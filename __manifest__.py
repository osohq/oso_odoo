# -*- coding: utf-8 -*-
{
    "name": "oso_odoo",
    "summary": "oso authorization module for odoo",
    "description": "oso is an open source policy engine for authorization that you embed in your application",
    "author": "oso",
    "website": "https://www.osohq.com/",
    "category": "Security",
    "version": "0.1",
    "depends": ["base"],
    "data": [
        "views/actions.xml",
        "security/ir.model.access.csv",
    ],
    "demo": [
        "demo/oso.policy.csv",
        "demo/oso.test.model.csv",
        "demo/oso.test.organization.csv",
        "demo/oso.test.repository.csv",
        "demo/oso.model.access.csv",
        "views/demo_views.xml",
    ],
    "auto_install": True,
}
