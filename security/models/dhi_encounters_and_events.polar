
# user_access.dhi_group_administration
permission("user_access.dhi_group_administration", "RWCU", resource) if 
	resource in [
		"dhi.encounter",
		"dhi.encounter.documents"
	];

# user_access.dhi_group_receptionist
permission("user_access.dhi_group_receptionist", "RWC", resource) if 
	resource in [
		"dhi.encounter",
		"dhi.encounter.documents"
	];

# user_access.dhi_group_billing
permission("user_access.dhi_group_billing", "RWC", resource) if 
	resource in [
		"dhi.encounter",
		"dhi.encounter.documents"
	];

# user_access.dhi_group_nurse
permission("user_access.dhi_group_nurse", "RWC", resource) if 
	resource in [
		"dhi.encounter",
		"dhi.encounter.documents"
	];

# user_access.dhi_group_doctor
permission("user_access.dhi_group_doctor", "RWC", resource) if 
	resource in [
		"dhi.encounter",
		"dhi.encounter.documents"
	];

# user_access.dhi_group_inventory
permission("user_access.dhi_group_inventory", "RWC", resource) if 
	resource in [
		"dhi.encounter",
		"dhi.encounter.documents"
	];

# user_access.dhi_group_lab
permission("user_access.dhi_group_lab", "RWC", resource) if 
	resource in [
		"dhi.encounter",
		"dhi.encounter.documents"
	];

# user_access.dhi_group_imaging
permission("user_access.dhi_group_imaging", "RWC", resource) if 
	resource in [
		"dhi.encounter",
		"dhi.encounter.documents"
	];

# user_access.dhi_group_hr
permission("user_access.dhi_group_hr", "RWC", resource) if 
	resource in [
		"dhi.encounter",
		"dhi.encounter.documents"
	];

# user_access.dhi_group_super_admin
permission("user_access.dhi_group_super_admin", "RWCU", resource) if 
	resource in [
		"dhi.encounter",
		"dhi.encounter.documents"
	];
