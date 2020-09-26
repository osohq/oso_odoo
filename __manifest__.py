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
        "security/ir.model.access.csv",
        "security/oso.model.access.csv",
    ],
}
