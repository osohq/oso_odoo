FROM odoo:13

USER root

RUN python3 -m pip install --quiet --upgrade pip && python3 -m pip install --quiet oso==0.8.2

USER odoo

ENTRYPOINT odoo -i base,web --stop-after-init --log-level=error --database=odoo --db_host=localhost --db_password=odoo && odoo -i oso_odoo --test-enable --stop-after-init --log-level=error --database=odoo --db_host=localhost --db_password=odoo
