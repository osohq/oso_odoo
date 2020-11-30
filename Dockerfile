FROM odoo:13

RUN python3 -m pip install --upgrade pip && python3 -m pip install oso==0.8.2

ENTRYPOINT PYTHONPATH=$(python3 -c "import site; print(site.USER_SITE)") odoo -i oso_odoo --test-enable --stop-after-init --log-level=error --database=odoo --db_host=localhost --db_password=odoo
