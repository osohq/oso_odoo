FROM odoo:13

RUN pip3 install --upgrade pip && pip3 install oso==0.8.2

ENTRYPOINT ["odoo", "-i", "oso_odoo", "--test-enable", "--stop-after-init", "--log-level=error", "--database=odoo", "--db_host=localhost", "--db_password=odoo"]
