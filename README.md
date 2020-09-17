# oso_auth

oso's Odoo module

## Installation

`cd` into your Odoo addons directory of choice and clone the repository
into a directory named `oso_auth`, e.g.

```shell
$ cd odoo/addons
$ git clone https://github.com/osohq/oso-odoo.git oso_auth
```

The module should now be in your Odoo addons path. To install the module through the Odoo web interface,
search for "oso_auth" on the "Apps" page, making sure to clear the "Apps" filter:

![The odoo search box](odoo_search.png)

Click "install" on the "oso_auth" tile.

You can also install the module on the command line using `odoo-bin`:

```shell
$ odoo-bin -i oso_auth -d <database>
```
