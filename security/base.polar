# Model-level rules.
allow(_actor, _action, resource: String) if
    #resource.startswith("ir.") or
    #resource.startswith("res.") or
    resource.startswith("web_tour.");

# Record-level rules.
allow(_actor, _action, resource) if
    not resource matches String and
    resource._name.startswith("ir.") or
    resource._name.startswith("res.");
