
# group_sql_request_user
permission("group_sql_request_user", "R", resource) if 
	resource = "sql.request.mixin";

# group_sql_request_manager
permission("group_sql_request_manager", "RWCU", resource) if 
	resource in [
		"bi.sql.view",
		"bi.sql.view.field",
		"sql.request.mixin"
	];
