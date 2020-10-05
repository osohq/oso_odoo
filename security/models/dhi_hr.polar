
# base.group_user
permission("base.group_user", "R", resource) if 
	resource in [
		"dhi.hr.department",
		"dhi.hr.employee",
		"dhi.hr.employee.category"
	];

# user_access.dhi_group_administration
permission("user_access.dhi_group_administration", "RWCU", resource) if 
	resource in [
		"dhi.calendar.schedule",
		"dhi.calendar.schedule.event",
		"dhi.calendar.weekdays",
		"dhi.hr.department",
		"dhi.hr.employee",
		"dhi.hr.employee.category",
		"dhi.hr.employee.children",
		"dhi.hr.employee.documents",
		"dhi.hr.employee.education",
		"dhi.hr.employee.leaves",
		"dhi.hr.employee.training.official",
		"dhi.hr.employee.training.previous",
		"dhi.hr.job",
		"dhi.hr.work.location",
		"ir.actions.act_window",
		"ir.property",
		"ir.sequence",
		"ir.ui.view",
		"res.company",
		"res.partner",
		"res.users",
		"resource.resource"
	];

# user_access.dhi_group_receptionist
permission("user_access.dhi_group_receptionist", "RWCU", resource) if 
	resource in [
		"dhi.calendar.schedule",
		"dhi.hr.employee.leaves",
		"ir.actions.act_window",
		"ir.sequence",
		"ir.ui.view",
		"res.partner",
		"res.users"
	];
permission("user_access.dhi_group_receptionist", "RWC", resource) if 
	resource = "dhi.calendar.schedule.event";
permission("user_access.dhi_group_receptionist", "RW", resource) if 
	resource in [
		"dhi.calendar.weekdays",
		"dhi.hr.department",
		"dhi.hr.employee",
		"dhi.hr.employee.category",
		"dhi.hr.employee.children",
		"dhi.hr.employee.documents",
		"dhi.hr.employee.education",
		"dhi.hr.employee.training.official",
		"dhi.hr.employee.training.previous",
		"dhi.hr.job",
		"dhi.hr.work.location",
		"ir.property",
		"resource.resource"
	];

# user_access.dhi_group_nurse
permission("user_access.dhi_group_nurse", "RWCU", resource) if 
	resource in [
		"dhi.hr.employee.leaves",
		"ir.sequence"
	];
permission("user_access.dhi_group_nurse", "R", resource) if 
	resource in [
		"dhi.calendar.schedule",
		"dhi.calendar.schedule.event",
		"dhi.calendar.weekdays",
		"dhi.hr.department",
		"dhi.hr.employee",
		"dhi.hr.employee.category",
		"dhi.hr.employee.children",
		"dhi.hr.employee.documents",
		"dhi.hr.employee.education",
		"dhi.hr.employee.training.official",
		"dhi.hr.employee.training.previous",
		"dhi.hr.job",
		"dhi.hr.work.location",
		"ir.property",
		"resource.resource"
	];

# user_access.dhi_group_lab
permission("user_access.dhi_group_lab", "RWCU", resource) if 
	resource in [
		"dhi.hr.employee.leaves",
		"ir.sequence"
	];
permission("user_access.dhi_group_lab", "R", resource) if 
	resource in [
		"dhi.calendar.schedule",
		"dhi.calendar.schedule.event",
		"dhi.calendar.weekdays",
		"dhi.hr.department",
		"dhi.hr.employee",
		"dhi.hr.employee.category",
		"dhi.hr.employee.children",
		"dhi.hr.employee.documents",
		"dhi.hr.employee.education",
		"dhi.hr.employee.training.official",
		"dhi.hr.employee.training.previous",
		"dhi.hr.job",
		"dhi.hr.work.location",
		"ir.property",
		"resource.resource"
	];

# user_access.dhi_group_billing
permission("user_access.dhi_group_billing", "RWCU", resource) if 
	resource in [
		"dhi.hr.employee.leaves",
		"ir.sequence"
	];
permission("user_access.dhi_group_billing", "R", resource) if 
	resource in [
		"dhi.calendar.schedule",
		"dhi.calendar.schedule.event",
		"dhi.calendar.weekdays",
		"dhi.hr.department",
		"dhi.hr.employee",
		"dhi.hr.employee.category",
		"dhi.hr.employee.children",
		"dhi.hr.employee.documents",
		"dhi.hr.employee.education",
		"dhi.hr.employee.training.official",
		"dhi.hr.employee.training.previous",
		"dhi.hr.job",
		"dhi.hr.work.location",
		"ir.property",
		"resource.resource"
	];

# user_access.dhi_group_doctor
permission("user_access.dhi_group_doctor", "RWCU", resource) if 
	resource in [
		"dhi.hr.employee.leaves",
		"ir.sequence"
	];
permission("user_access.dhi_group_doctor", "RWC", resource) if 
	resource in [
		"dhi.calendar.schedule",
		"dhi.calendar.schedule.event"
	];
permission("user_access.dhi_group_doctor", "R", resource) if 
	resource in [
		"dhi.calendar.weekdays",
		"dhi.hr.department",
		"dhi.hr.employee",
		"dhi.hr.employee.category",
		"dhi.hr.employee.children",
		"dhi.hr.employee.documents",
		"dhi.hr.employee.education",
		"dhi.hr.employee.training.official",
		"dhi.hr.employee.training.previous",
		"dhi.hr.job",
		"dhi.hr.work.location",
		"ir.property",
		"resource.resource"
	];

# user_access.dhi_group_inventory
permission("user_access.dhi_group_inventory", "RWCU", resource) if 
	resource in [
		"dhi.hr.employee.leaves",
		"ir.sequence"
	];
permission("user_access.dhi_group_inventory", "R", resource) if 
	resource in [
		"dhi.calendar.schedule",
		"dhi.calendar.schedule.event",
		"dhi.calendar.weekdays",
		"dhi.hr.department",
		"dhi.hr.employee",
		"dhi.hr.employee.category",
		"dhi.hr.employee.children",
		"dhi.hr.employee.documents",
		"dhi.hr.employee.education",
		"dhi.hr.employee.training.official",
		"dhi.hr.employee.training.previous",
		"dhi.hr.job",
		"dhi.hr.work.location",
		"ir.property",
		"resource.resource"
	];

# user_access.dhi_group_hr
permission("user_access.dhi_group_hr", "RWCU", resource) if 
	resource in [
		"dhi.calendar.schedule",
		"dhi.calendar.schedule.event",
		"dhi.calendar.weekdays",
		"dhi.hr.department",
		"dhi.hr.employee",
		"dhi.hr.employee.category",
		"dhi.hr.employee.children",
		"dhi.hr.employee.documents",
		"dhi.hr.employee.education",
		"dhi.hr.employee.leaves",
		"dhi.hr.employee.training.official",
		"dhi.hr.employee.training.previous",
		"dhi.hr.job",
		"dhi.hr.work.location",
		"ir.actions.act_window",
		"ir.property",
		"ir.sequence",
		"ir.ui.view",
		"res.company",
		"res.partner",
		"res.users",
		"resource.resource"
	];

# user_access.dhi_group_imaging
permission("user_access.dhi_group_imaging", "RWCU", resource) if 
	resource in [
		"dhi.hr.employee.leaves",
		"ir.sequence"
	];
permission("user_access.dhi_group_imaging", "R", resource) if 
	resource in [
		"dhi.calendar.schedule",
		"dhi.calendar.schedule.event",
		"dhi.calendar.weekdays",
		"dhi.hr.department",
		"dhi.hr.employee",
		"dhi.hr.employee.category",
		"dhi.hr.employee.children",
		"dhi.hr.employee.documents",
		"dhi.hr.employee.education",
		"dhi.hr.employee.training.official",
		"dhi.hr.employee.training.previous",
		"dhi.hr.job",
		"dhi.hr.work.location",
		"ir.property",
		"resource.resource"
	];

# user_access.dhi_group_super_admin
permission("user_access.dhi_group_super_admin", "RWCU", resource) if 
	resource in [
		"dhi.calendar.schedule",
		"dhi.calendar.schedule.event",
		"dhi.calendar.weekdays",
		"dhi.hr.department",
		"dhi.hr.employee",
		"dhi.hr.employee.category",
		"dhi.hr.employee.children",
		"dhi.hr.employee.documents",
		"dhi.hr.employee.education",
		"dhi.hr.employee.leaves",
		"dhi.hr.employee.training.official",
		"dhi.hr.employee.training.previous",
		"dhi.hr.job",
		"dhi.hr.work.location",
		"ir.actions.act_window",
		"ir.property",
		"ir.sequence",
		"ir.ui.view",
		"res.company",
		"res.partner",
		"res.users",
		"resource.resource"
	];
