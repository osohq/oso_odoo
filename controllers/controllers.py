# -*- coding: utf-8 -*-
# from odoo import http


# class OsoAuth(http.Controller):
#     @http.route('/oso_auth/oso_auth/', auth='public')
#     def index(self, **kw):
#         return "Hello, world"

#     @http.route('/oso_auth/oso_auth/objects/', auth='public')
#     def list(self, **kw):
#         return http.request.render('oso_auth.listing', {
#             'root': '/oso_auth/oso_auth',
#             'objects': http.request.env['oso_auth.oso_auth'].search([]),
#         })

#     @http.route('/oso_auth/oso_auth/objects/<model("oso_auth.oso_auth"):obj>/', auth='public')
#     def object(self, obj, **kw):
#         return http.request.render('oso_auth.object', {
#             'object': obj
#         })
