FROM odoo:13

RUN echo "hi"

RUN pip3 install --upgrade pip && pip3 install oso==0.8.2

ENTRYPOINT echo "import oso; print(oso)" | odoo shell

# ENTRYPOINT ["odoo", "-c", "import oso"]

# RUN python -c 
# RUN python -c 'import oso'

# ENTRYPOINT ["odoo", "-i", "oso_odoo", "--test-enable", "--stop-after-init", "--log-level=error", "--database=odoo", "--db_host=db", "--db_password=odoo"]
