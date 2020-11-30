FROM odoo:13

USER root

RUN python3 -m pip install --quiet --upgrade pip && python3 -m pip install --quiet oso==0.8.2

USER odoo

# ENTRYPOINT python3 -m pip show oso

# ENTRYPOINT PYTHONPATH=$(python3 -c "import site; print(site.USER_SITE)") python3 -m oso
ENTRYPOINT odoo -i oso_odoo --test-enable --stop-after-init --log-level=error --database=odoo --db_host=localhost --db_password=odoo
