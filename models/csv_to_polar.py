import os
import sys
from os.path import basename, dirname, realpath
from pathlib import Path
import pandas as pd

odoo_env = None


def to_polar_consolidated(ifile, ofile, prefix):
    # read csv file into DataFrame
    df = pd.read_csv(ifile).dropna()
    df = df.drop(["name", "id"], axis="columns")

    group_col = "group_id:id"
    model_col = "model_id:id"

    try:
        roles = df[group_col].unique()
    except KeyError:
        group_col = "group_id/id"
        model_col = "model_id/id"
        roles = df[group_col].unique()

    actions = ["perm_unlink", "perm_create", "perm_write", "perm_read"]
    action_map = {
        "perm_unlink": "RWCU",
        "perm_create": "RWC",
        "perm_write": "RW",
        "perm_read": "R",
    }

    # for each unique role-permissions combination, write a rule over all applicable models
    for role in roles:
        ofile.write(f"\n# {role}\n")
        rdf = df[df[group_col] == role]  # df for this role

        for action in actions:
            radf = rdf[rdf[action] == 1]  # df for this role-action pair
            rdf = rdf.drop(radf.index)

            models = []
            # get all applicable models
            for s in radf[model_col].unique():
                if "." in s:
                    xml_id = s
                else:
                    xml_id = f"{prefix}.{s}"
                try:
                    model = odoo_env["ir.model.data"].xmlid_to_object(xml_id)
                except IndexError:
                    print("whyyyyy odoo")
                    continue
                if not model:
                    print("What the hell is, ", xml_id)
                    continue
                models.append(f'"{model.model}"')
            models = sorted(models)
            if not models:
                continue
            elif len(models) == 1:
                rule_body = f"resource = {models[0]}"
            else:
                models = (",\n\t\t").join(models)
                rule_body = f"resource in [\n\t\t{models}\n\t]"

            # write rule_str to file
            rule_str = f'permission("{role}", "{action_map[action]}", resource) if \n\t{rule_body};\n'
            ofile.write(rule_str)


def convert_csv(self, odoo=None):
    global odoo_env
    odoo_env = odoo

    output_dir = "/tmp/policy/models/"
    if not os.path.exists(output_dir):
        os.mkdir(output_dir)

    healthsuite_root = Path(__file__).parent.parent
    # Run in Dhi healthsuite-addons directory
    d = [dir[0] for dir in os.walk(healthsuite_root) if "security" in dir[1]]

    # Write policy file for each module `./oso_policy/{prefix}.polar`
    for dir in d:
        prefix = os.path.basename(dir)

        csv_filepath = dir + "/security/ir.model.access.csv"
        polar_filepath = f"{output_dir}{prefix}.polar"

        ifile = open(csv_filepath, "r")
        ofile = open(polar_filepath, "w")

        print(f"Converting rules for {prefix}...")
        to_polar_consolidated(ifile, ofile, prefix)
        ifile.close()
        ofile.close()

    print("Done!")


if __name__ == "__main__":
    convert_csv()
    # test()
