# -*- coding: utf-8 -*-
{
    "name": "oso_odoo",
    "summary": "oso authorization library",
    "description": "oso is an open source policy engine for authorization that you embed in your application",
    "author": "oso",
    "website": "https://www.osohq.com/",
    "category": "Security",
    "version": "0.1",
    "depends": ["base"],
    "data": [
        "views/actions.xml",
    ],
    # only loaded in demonstration mode
    "demo": [
        "demo/demo.xml",
    ],
}
