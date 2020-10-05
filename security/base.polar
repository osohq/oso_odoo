allow(_, _, _);

allow(actor: Users { id: 2}, _action, resource: String);
# Default allow for all base models that aren't UI menus
allow(_actor, _action, resource: base) if
    not is_checked_model(resource);

is_checked_model(_: ir::ui::menu);

filter_allow(actor, action, [],[]);
filter_allow(actor, action, [x],[x]);
filter_allow(actor, action, [x,x,*xs],zs) if
    filter_allow(actor, action, [x,*xs], zs);
filter_allow(actor, action, [x,y,*ys],[x,*zs]) if
    allow(actor, action, x)
    and filter_allow(actor, action, [y,*ys],zs);


allow(actor, action, resource: List) if
    forall(el in resource, allow(actor, action, el));


allow(actor, action, resource: Dict) if
    not resource.model;

# Allow rule for UI menus.
allow(actor, "read", resource: ir::ui::menu) if
    true;
    # forall(
    #     menu = resource, 
    #     allow_ir_menu(actor, resource)
    # );

allow_ir_menu(actor, resource) if
    [model, name] = resource.get_xml_id().(_).split(".")
    and allow_menu(actor, model, name);

# Allow rule for menu if a child menu is visible.
allow_ir_menu(actor, resource) if
    child_menu = resource.child_id
    and allow_ir_menu(actor, child_menu);

allow_menu(actor, model, name) if
    role(actor, role)
    and menu_permission(role, model, name);

# Top-level allow
allow(actor, action, resource: String) if
    role(actor, role) and
    has_perm(role, action, resource);

# Lookup role for user
role(user: Users, role) if
    role = user.groups_id.get_xml_id().(_);

# Action short-cuts
# Assume actions are hierarchical: R < RW < RWC < RWCU
has_perm(role, "read", resource) if
    permission(role, "R", resource)
    or permission(role, "RW", resource)
    or permission(role, "RWC", resource)
    or permission(role, "RWCU", resource);

has_perm(role, "write", resource) if
    permission(role, "RW", resource)
    or permission(role, "RWC", resource)
    or permission(role, "RWCU", resource);

has_perm(role, "create", resource) if
    permission(role, "RWC", resource)
    or permission(role, "RWCU", resource);

has_perm(role, "unlink", resource) if
    permission(role, "RWCU", resource);

permission(_role, "RWCU", "oso.helper");