
# user_access.dhi_group_receptionist
permission("user_access.dhi_group_receptionist", "RW", resource) if 
	resource in [
		"dhi.patient.procedure",
		"dhi.patient.procedure.addon.line",
		"dhi.patient.service",
		"dhi.patient.service.line",
		"dhi.procedure.variants",
		"mrp.bom",
		"mrp.bom.line",
		"mrp.bom.service",
		"mrp.document",
		"mrp.procedure.service.line"
	];
permission("user_access.dhi_group_receptionist", "R", resource) if 
	resource in [
		"dhi.cpt.category",
		"dhi.cpt.code",
		"dhi.geo.category",
		"dhi.geo.code"
	];

# user_access.dhi_group_billing
permission("user_access.dhi_group_billing", "RWCU", resource) if 
	resource in [
		"dhi.cpt.category",
		"dhi.cpt.code",
		"dhi.geo.category",
		"dhi.geo.code"
	];
permission("user_access.dhi_group_billing", "R", resource) if 
	resource in [
		"dhi.patient.procedure",
		"dhi.patient.procedure.addon.line",
		"dhi.patient.service",
		"dhi.patient.service.line",
		"dhi.procedure.variants",
		"mrp.bom",
		"mrp.bom.line",
		"mrp.bom.service",
		"mrp.bom.service.line",
		"mrp.procedure.service.line"
	];

# user_access.dhi_group_nurse
permission("user_access.dhi_group_nurse", "RWCU", resource) if 
	resource in [
		"dhi.cpt.category",
		"dhi.cpt.code",
		"dhi.geo.category",
		"dhi.geo.code",
		"dhi.patient.procedure.addon.line",
		"mrp.bom",
		"mrp.bom.line",
		"mrp.bom.service.line",
		"mrp.procedure.service.line"
	];
permission("user_access.dhi_group_nurse", "RWC", resource) if 
	resource in [
		"dhi.patient.procedure",
		"dhi.patient.service",
		"dhi.patient.service.line",
		"dhi.procedure.variants",
		"mrp.bom.service",
		"mrp.document"
	];

# user_access.dhi_group_doctor
permission("user_access.dhi_group_doctor", "RWCU", resource) if 
	resource in [
		"dhi.cpt.category",
		"dhi.cpt.code",
		"dhi.geo.category",
		"dhi.geo.code",
		"dhi.patient.procedure.addon.line",
		"mrp.bom",
		"mrp.bom.line",
		"mrp.procedure.service.line"
	];
permission("user_access.dhi_group_doctor", "RWC", resource) if 
	resource in [
		"dhi.patient.procedure",
		"dhi.patient.service",
		"dhi.patient.service.line",
		"dhi.procedure.variants",
		"mrp.bom.service",
		"mrp.bom.service.line",
		"mrp.document"
	];

# user_access.dhi_group_inventory
permission("user_access.dhi_group_inventory", "R", resource) if 
	resource in [
		"dhi.cpt.category",
		"dhi.cpt.code",
		"dhi.geo.category",
		"dhi.geo.code",
		"dhi.patient.procedure",
		"dhi.patient.procedure.addon.line",
		"dhi.patient.service",
		"dhi.patient.service.line",
		"dhi.procedure.variants",
		"mrp.bom",
		"mrp.bom.line",
		"mrp.bom.service",
		"mrp.bom.service.line",
		"mrp.document",
		"mrp.procedure.service.line"
	];

# user_access.dhi_group_lab
permission("user_access.dhi_group_lab", "R", resource) if 
	resource in [
		"dhi.cpt.category",
		"dhi.cpt.code",
		"dhi.geo.category",
		"dhi.geo.code",
		"dhi.patient.procedure",
		"dhi.patient.procedure.addon.line",
		"dhi.patient.service",
		"dhi.patient.service.line",
		"dhi.procedure.variants",
		"mrp.bom",
		"mrp.bom.line",
		"mrp.bom.service",
		"mrp.bom.service.line",
		"mrp.document",
		"mrp.procedure.service.line"
	];

# user_access.dhi_group_imaging
permission("user_access.dhi_group_imaging", "R", resource) if 
	resource in [
		"dhi.cpt.category",
		"dhi.cpt.code",
		"dhi.geo.category",
		"dhi.geo.code",
		"dhi.patient.procedure",
		"dhi.patient.procedure.addon.line",
		"dhi.patient.service",
		"dhi.patient.service.line",
		"dhi.procedure.variants",
		"mrp.bom",
		"mrp.bom.line",
		"mrp.bom.service",
		"mrp.bom.service.line",
		"mrp.document",
		"mrp.procedure.service.line"
	];

# user_access.dhi_group_hr
permission("user_access.dhi_group_hr", "RWCU", resource) if 
	resource in [
		"mrp.bom",
		"mrp.bom.line",
		"mrp.bom.service",
		"mrp.bom.service.line"
	];
permission("user_access.dhi_group_hr", "R", resource) if 
	resource in [
		"dhi.cpt.category",
		"dhi.cpt.code",
		"dhi.geo.category",
		"dhi.geo.code",
		"dhi.patient.procedure",
		"dhi.patient.procedure.addon.line",
		"dhi.patient.service",
		"dhi.patient.service.line",
		"dhi.procedure.variants",
		"mrp.document",
		"mrp.procedure.service.line"
	];

# user_access.dhi_group_administration
permission("user_access.dhi_group_administration", "RWCU", resource) if 
	resource in [
		"dhi.cpt.category",
		"dhi.cpt.code",
		"dhi.geo.category",
		"dhi.geo.code",
		"dhi.patient.mrp.role.fraction.line",
		"dhi.patient.procedure",
		"dhi.patient.procedure.addon.line",
		"dhi.patient.service",
		"dhi.patient.service.line",
		"dhi.procedure.variants",
		"mrp.bom",
		"mrp.bom.line",
		"mrp.bom.service",
		"mrp.bom.service.line",
		"mrp.document",
		"mrp.procedure.service.line"
	];

# user_access.dhi_group_super_admin
permission("user_access.dhi_group_super_admin", "RWCU", resource) if 
	resource in [
		"dhi.cpt.category",
		"dhi.cpt.code",
		"dhi.geo.category",
		"dhi.geo.code",
		"dhi.patient.mrp.role.fraction.line",
		"dhi.patient.procedure",
		"dhi.patient.procedure.addon.line",
		"dhi.patient.service",
		"dhi.patient.service.line",
		"dhi.procedure.variants",
		"mrp.bom",
		"mrp.bom.line",
		"mrp.bom.service",
		"mrp.bom.service.line",
		"mrp.document",
		"mrp.procedure.service.line"
	];
