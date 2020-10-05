
# user_access.dhi_group_administration
permission("user_access.dhi_group_administration", "RWCU", resource) if 
	resource in [
		"dhi.hr.contract",
		"dhi.hr.contract.appraisals",
		"dhi.hr.contract.documents",
		"dhi.hr.contract.type",
		"resource.calendar",
		"resource.calendar.attendance",
		"resource.resource"
	];

# user_access.dhi_group_nurse
permission("user_access.dhi_group_nurse", "R", resource) if 
	resource in [
		"dhi.hr.contract",
		"dhi.hr.contract.appraisals",
		"dhi.hr.contract.documents",
		"dhi.hr.contract.type",
		"resource.calendar",
		"resource.calendar.attendance",
		"resource.resource"
	];

# user_access.dhi_group_receptionist
permission("user_access.dhi_group_receptionist", "R", resource) if 
	resource in [
		"dhi.hr.contract",
		"dhi.hr.contract.appraisals",
		"dhi.hr.contract.documents",
		"dhi.hr.contract.type",
		"resource.calendar",
		"resource.calendar.attendance",
		"resource.resource"
	];

# user_access.dhi_group_billing
permission("user_access.dhi_group_billing", "R", resource) if 
	resource in [
		"dhi.hr.contract",
		"dhi.hr.contract.appraisals",
		"dhi.hr.contract.documents",
		"dhi.hr.contract.type",
		"resource.calendar",
		"resource.calendar.attendance",
		"resource.resource"
	];

# user_access.dhi_group_doctor
permission("user_access.dhi_group_doctor", "R", resource) if 
	resource in [
		"dhi.hr.contract",
		"dhi.hr.contract.appraisals",
		"dhi.hr.contract.documents",
		"dhi.hr.contract.type",
		"resource.calendar",
		"resource.calendar.attendance",
		"resource.resource"
	];

# user_access.dhi_group_inventory
permission("user_access.dhi_group_inventory", "R", resource) if 
	resource in [
		"dhi.hr.contract",
		"dhi.hr.contract.appraisals",
		"dhi.hr.contract.documents",
		"dhi.hr.contract.type",
		"resource.calendar",
		"resource.calendar.attendance",
		"resource.resource"
	];

# user_access.dhi_group_lab
permission("user_access.dhi_group_lab", "R", resource) if 
	resource in [
		"dhi.hr.contract",
		"dhi.hr.contract.appraisals",
		"dhi.hr.contract.documents",
		"dhi.hr.contract.type",
		"resource.calendar",
		"resource.calendar.attendance",
		"resource.resource"
	];

# user_access.dhi_group_imaging
permission("user_access.dhi_group_imaging", "R", resource) if 
	resource in [
		"dhi.hr.contract",
		"dhi.hr.contract.appraisals",
		"dhi.hr.contract.documents",
		"dhi.hr.contract.type",
		"resource.calendar",
		"resource.calendar.attendance",
		"resource.resource"
	];

# user_access.dhi_group_hr
permission("user_access.dhi_group_hr", "RWCU", resource) if 
	resource in [
		"dhi.hr.contract",
		"dhi.hr.contract.appraisals",
		"dhi.hr.contract.documents",
		"dhi.hr.contract.type",
		"resource.calendar",
		"resource.calendar.attendance",
		"resource.resource"
	];

# user_access.dhi_group_super_admin
permission("user_access.dhi_group_super_admin", "RWCU", resource) if 
	resource in [
		"dhi.hr.contract",
		"dhi.hr.contract.appraisals",
		"dhi.hr.contract.documents",
		"dhi.hr.contract.type",
		"resource.calendar",
		"resource.calendar.attendance",
		"resource.resource"
	];
