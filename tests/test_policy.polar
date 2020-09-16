allow(_actor, "create", resource) if
    not resource matches ir::qweb and # record level
    not resource matches "ir.ui.menu"; # model level

allow(_actor, "read", resource) if
    not (resource matches ir::mail_server and
         resource.smtp_host = "smtp.example.org");

allow(_actor, "write", resource) if
    not resource matches ir::qweb;

allow(_actor, "unlink", resource) if
    not resource matches ir::qweb;
