# Model-level access control.
allow(actor, action, "oso.test.model") if
    actor.login = "demo" and
    action in ["create", "read", "unlink"];

# Record-level access control.
allow(_actor, "create", resource: oso::test::model) if
    resource.good;
allow(_actor, "unlink", _resource: oso::test::model);
