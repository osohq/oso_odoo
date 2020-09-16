allow(_actor, "read", resource: mail::message) if
    print(resource);

allow(_, _, _);