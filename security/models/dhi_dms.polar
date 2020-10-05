
# user_access.dhi_group_administration
permission("user_access.dhi_group_administration", "RWCU", resource) if 
	resource in [
		"dhi_dms.category",
		"dhi_dms.directory",
		"dhi_dms.file",
		"dhi_dms.tag"
	];
permission("user_access.dhi_group_administration", "RWC", resource) if 
	resource = "dhi_dms.storage";

# user_access.dhi_group_super_admin
permission("user_access.dhi_group_super_admin", "RWCU", resource) if 
	resource in [
		"dhi_dms.category",
		"dhi_dms.directory",
		"dhi_dms.file",
		"dhi_dms.storage",
		"dhi_dms.tag"
	];

# user_access.dhi_group_doctor
permission("user_access.dhi_group_doctor", "RWCU", resource) if 
	resource in [
		"dhi_dms.category",
		"dhi_dms.directory",
		"dhi_dms.file",
		"dhi_dms.tag"
	];
permission("user_access.dhi_group_doctor", "RWC", resource) if 
	resource = "dhi_dms.storage";

# user_access.dhi_group_nurse
permission("user_access.dhi_group_nurse", "RWCU", resource) if 
	resource in [
		"dhi_dms.category",
		"dhi_dms.directory",
		"dhi_dms.file",
		"dhi_dms.tag"
	];
permission("user_access.dhi_group_nurse", "RWC", resource) if 
	resource = "dhi_dms.storage";

# user_access.dhi_group_receptionist
permission("user_access.dhi_group_receptionist", "RWCU", resource) if 
	resource in [
		"dhi_dms.category",
		"dhi_dms.directory",
		"dhi_dms.file",
		"dhi_dms.tag"
	];
permission("user_access.dhi_group_receptionist", "RWC", resource) if 
	resource = "dhi_dms.storage";

# user_access.dhi_group_billing
permission("user_access.dhi_group_billing", "RWCU", resource) if 
	resource in [
		"dhi_dms.category",
		"dhi_dms.directory",
		"dhi_dms.file",
		"dhi_dms.tag"
	];
permission("user_access.dhi_group_billing", "RWC", resource) if 
	resource = "dhi_dms.storage";

# user_access.dhi_group_inventory
permission("user_access.dhi_group_inventory", "RWCU", resource) if 
	resource in [
		"dhi_dms.category",
		"dhi_dms.directory",
		"dhi_dms.file",
		"dhi_dms.tag"
	];
permission("user_access.dhi_group_inventory", "RWC", resource) if 
	resource = "dhi_dms.storage";

# user_access.dhi_group_lab
permission("user_access.dhi_group_lab", "RWCU", resource) if 
	resource in [
		"dhi_dms.category",
		"dhi_dms.directory",
		"dhi_dms.file",
		"dhi_dms.tag"
	];
permission("user_access.dhi_group_lab", "RWC", resource) if 
	resource = "dhi_dms.storage";

# user_access.dhi_group_imaging
permission("user_access.dhi_group_imaging", "RWCU", resource) if 
	resource in [
		"dhi_dms.category",
		"dhi_dms.directory",
		"dhi_dms.file",
		"dhi_dms.tag"
	];
permission("user_access.dhi_group_imaging", "RWC", resource) if 
	resource = "dhi_dms.storage";

# user_access.dhi_group_hr
permission("user_access.dhi_group_hr", "RWCU", resource) if 
	resource in [
		"dhi_dms.category",
		"dhi_dms.directory",
		"dhi_dms.file",
		"dhi_dms.tag"
	];
permission("user_access.dhi_group_hr", "RWC", resource) if 
	resource = "dhi_dms.storage";
