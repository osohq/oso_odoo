
# base.group_system
permission("base.group_system", "RWCU", resource) if 
	resource = "dhi_autovacuum.rules";

# user_access.dhi_group_administration
permission("user_access.dhi_group_administration", "RWCU", resource) if 
	resource = "dhi_autovacuum.rules";

# user_access.dhi_group_super_admin
permission("user_access.dhi_group_super_admin", "RWCU", resource) if 
	resource = "dhi_autovacuum.rules";
