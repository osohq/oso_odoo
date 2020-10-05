
# base.group_user
permission("base.group_user", "RWC", resource) if 
	resource = "dhi.hr.attendance";

# user_access.dhi_group_administration
permission("user_access.dhi_group_administration", "RWCU", resource) if 
	resource = "dhi.hr.attendance";

# user_access.dhi_group_billing
permission("user_access.dhi_group_billing", "R", resource) if 
	resource = "dhi.hr.attendance";

# user_access.dhi_group_nurse
permission("user_access.dhi_group_nurse", "R", resource) if 
	resource = "dhi.hr.attendance";

# user_access.dhi_group_doctor
permission("user_access.dhi_group_doctor", "R", resource) if 
	resource = "dhi.hr.attendance";

# user_access.dhi_group_inventory
permission("user_access.dhi_group_inventory", "R", resource) if 
	resource = "dhi.hr.attendance";

# user_access.dhi_group_lab
permission("user_access.dhi_group_lab", "R", resource) if 
	resource = "dhi.hr.attendance";

# user_access.dhi_group_imaging
permission("user_access.dhi_group_imaging", "R", resource) if 
	resource = "dhi.hr.attendance";

# user_access.dhi_group_hr
permission("user_access.dhi_group_hr", "RWCU", resource) if 
	resource = "dhi.hr.attendance";

# user_access.dhi_group_super_admin
permission("user_access.dhi_group_super_admin", "RWCU", resource) if 
	resource = "dhi.hr.attendance";
