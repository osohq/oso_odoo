allow(_actor, "create", resource) if
    not resource matches mail::message;

allow(_actor, "read", resource) if
    not resource matches mail::message;

allow(_actor, "write", resource) if
    not resource matches mail::message;

allow(_actor, "unlink", resource) if
    not resource matches sms::sms;
