# allow(_, action, resource: my_model) if
#     print(resource) and
#     not (action = "read");

allow(_, "read", resource) if
    print(resource) and
    not resource matches mail::message;