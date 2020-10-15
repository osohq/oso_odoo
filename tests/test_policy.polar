# Model-level access control.
allow(actor, action, "oso.test.model") if
    actor.login = "demo" and
    action in ["create", "read", "unlink"];

# Record-level access control.
allow(_actor, "create", resource: oso::test::model) if
    resource.good;
allow(_actor, "unlink", _resource: oso::test::model);

allow(_, _, "oso");
allow(_, "read", "oso.test.repository");
allow(_, "read", "oso.test.organization");

allow(_, _, repo: oso::test::repository) if
    not repo.name.endswith("C");

allow(_, _, org: oso::test::organization) if
    org.name.endswith("A");
