import os
from pathlib import Path
import pandas as pd
import xml.etree.ElementTree as et
from os import listdir
from os.path import isfile


def parse_XML(xml_file, prefix):
    """Parse the input XML file and store the result in a pandas 
    DataFrame with the given columns. 

    The first element of df_cols is supposed to be the identifier 
    variable, which is an attribute of each node element in the 
    XML data; other features will be parsed from the text content 
    of each sub-element. 
    """

    try:
        xtree = et.parse(xml_file)
        xroot = xtree.getroot()
        xdata = xroot[0]
        assert xdata.tag == "data"
    except Exception as e:
        print(e)
        xdata = []
    rows = []
    
    for node in xdata:
        s_id = node.attrib.get("id")
        if "." in s_id:
            (model, id) = s_id.split(".")
        else:
            (model, id) = (prefix, s_id)
        s_groups = node.attrib.get("groups")
        s_parent = node.attrib.get("parent")
        if s_groups:
            for group in s_groups.split(","):
                rows.append({"id": id, "model": model,
                             "group": group, "parent": s_parent})
        else:
            rows.append({"id": id, "model": model,
                         "group": "any", "parent": s_parent})

    out_df = pd.DataFrame(rows, columns=["id", "group", "parent", "model"])
    return out_df


def to_polar_consolidated(df, ofile, prefix):
    group_col = "group"
    model_col = "model"
    id_col = "id"
    roles = df[group_col].unique()
    models = df[model_col].unique()
    # for each unique role-permissions combination, write a rule over all applicable models
    for model in models:
        mdf = df[df[model_col] == model]  # df for this model

        for role in roles:
            rmdf = mdf[mdf[group_col] == role]  # df for this model-id pair
            mdf = mdf.drop(rmdf.index)

            if role == "any":
                for _, row in rmdf.iterrows():
                    id = row['id']
                    parent = row['parent']
                    if parent:
                        if "." in parent:
                            (parent_model, parent_id) = parent.split(".")
                        else:
                            (parent_model, parent_id) = (model, parent)
                        rule_str = f'allow_menu(actor, "{model}", "{id}") if allow_menu(actor, "{parent_model}", "{parent_id}");\n'
                    else:
                        rule_str = f'allow_menu(_actor, "{model}", "{id}");\n'
                    ofile.write(rule_str)
                continue

            ids = []
            # get all applicable models
            for id in rmdf[id_col].unique():
                ids.append(f'"{id}"')
            ids = sorted(ids)
            if not ids:
                continue
            elif len(ids) == 1:
                rule_body = f"resource = {ids[0]}"
            else:
                ids = (",\n\t\t").join(ids)
                rule_body = f"resource in [\n\t\t{ids}\n\t]"
            role_str = "_" if role == "any" else f'"{role}"'
            # write rule_str to file
            rule_str = f'menu_permission({role_str}, "{model}", resource) if \n\t{rule_body};\n'
            ofile.write(rule_str)


def convert_xml():
    # global odoo_env
    # odoo_env = odoo

    output_dir = "/tmp/policy/views/"
    if not os.path.exists(output_dir):
        os.mkdir(output_dir)

    healthsuite_root = Path(__file__).resolve().parent.parent
    print(healthsuite_root)
    # Run in Dhi healthsuite-addons directory
    d = [dir[0] for dir in os.walk(healthsuite_root) if "views" in dir[1]]
    # Write policy file for each module `./oso_policy/{prefix}.polar`
    for dir in d:
        prefix = os.path.basename(dir)
        print(f"Walking {prefix}")

        xml_dir = Path(dir) / "views"
        polar_filepath = f"{output_dir}{prefix}.polar"
        df = pd.DataFrame([], columns=["id", "group", "parent", "model"])
        for f in listdir(xml_dir):
            if isfile(xml_dir / f) and f.endswith("xml"):
                xml_filepath = xml_dir / f
                print(f"Converting rules for {xml_filepath}...")
                ifile = open(xml_filepath, "r")
                df = df.append(parse_XML(ifile, prefix))
                ifile.close()

        ofile = open(polar_filepath, "w")
        to_polar_consolidated(df, ofile, prefix)
        ofile.close()

    print("Done!")


if __name__ == "__main__":
    convert_xml()
    # test()
