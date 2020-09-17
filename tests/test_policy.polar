# record-level rules
allow(_actor, "unlink", _resource);
allow(_actor, _action, _resource: ir::model::data);

allow(_actor, "create", _resource: ir::mail_server);
allow(_actor, "read", resource: ir::mail_server) if
    resource.smtp_host = "smtp.example.org";
allow(_actor, "write", _resource: ir::mail_server);

allow(_actor, "create", _resource: res::country);
allow(_actor, "read", _resource: res::country);
allow(_actor, "unlink", _resource: res::country);

# model-level rules
allow(_actor, _action, resource: String) if
    resource.startswith("ir.");

allow(_actor, action: String, resource: String) if
    action in ["create", "read"] and
    resource = "res.country" or
    resource.startswith("res.country.");

# Lookup role for user
role(user, role) if
    # get_xml_id() returns {3: "dhi.superadmin"}
    role = user.groups_id.get_xml_id().values();

allow(actor, action, _resource: ir::ui::menu) if
    action in ["create", "write"] and
    role(actor, "base.group_user");

