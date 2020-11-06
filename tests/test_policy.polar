# Model-level access control.
allow_model(actor, action, resource: String) if
    actor.login = "admin" or actor.login = "demo" and
    resource.startswith("oso.") and
    action in ["create", "read", "unlink"];

# Record-level access control.
allow(_actor, "read", _resource: oso::test::model);
allow(_actor, "create", resource: oso::test::model) if
    resource.good = true;
allow(_actor, "unlink", _resource: oso::test::model);

# Repository/organization access control.
allow_model(_, _, "oso");
allow_model(_, "read", "oso.test.repository");
allow_model(_, "read", "oso.test.organization");

allow(_, _, repo: oso::test::repository) if
    not repo.name.endswith("C");

allow(_, _, org: oso::test::organization) if
    org.name.endswith("A");
