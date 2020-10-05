
# user_access.dhi_group_receptionist
permission("user_access.dhi_group_receptionist", "RWC", resource) if 
	resource in [
		"dhi.imaging.patient.line",
		"dhi.lab.patient.line",
		"dhi.vaccination.first.dose",
		"dhi.vaccination.line"
	];
permission("user_access.dhi_group_receptionist", "RW", resource) if 
	resource in [
		"dhi.imaging.patient",
		"dhi.imaging.test",
		"dhi.imaging.test.category",
		"dhi.imaging.test.criteria",
		"dhi.lab.criteria.category",
		"dhi.lab.criteria.category.items",
		"dhi.lab.method",
		"dhi.lab.patient",
		"dhi.lab.result",
		"dhi.lab.test",
		"dhi.lab.test.category",
		"dhi.lab.test.criteria",
		"dhi.lab.test.criteria.group",
		"dhi.laboratory.services",
		"dhi.patient.lab.other.criterias",
		"dhi.patient.susceptibility.test",
		"dhi.susceptibility.test",
		"dhi.vaccination",
		"dhi.vaccination.booster.schedule",
		"dhi.vaccination.brands",
		"dhi.vaccination.category",
		"dhi.vaccination.patient",
		"dhi.vaccination.schedule",
		"dhi.vaccination.site",
		"dhi.vaccination.variants"
	];
permission("user_access.dhi_group_receptionist", "R", resource) if 
	resource in [
		"dhi.doses.vaccine.detail",
		"dhi.legacy.brand",
		"dhi.legacy.vaccine.booster",
		"dhi.legacy.vaccine.detail",
		"dhi.legacy.vaccine.template",
		"dhi.ppd.reading",
		"dhi.ppd.vaccine.detail",
		"dhi.sample.taken",
		"dhi.vaccination.legacy.history.patient",
		"dhi.yearly.vaccine.detail"
	];

# user_access.dhi_group_billing
permission("user_access.dhi_group_billing", "RWC", resource) if 
	resource = "dhi.vaccination.first.dose";
permission("user_access.dhi_group_billing", "RW", resource) if 
	resource in [
		"dhi.lab.criteria.category",
		"dhi.lab.criteria.category.items",
		"dhi.lab.patient.line",
		"dhi.lab.test.criteria.group",
		"dhi.laboratory.services",
		"dhi.patient.lab.other.criterias",
		"dhi.patient.susceptibility.test",
		"dhi.susceptibility.test",
		"dhi.vaccination.booster.schedule",
		"dhi.vaccination.brands",
		"dhi.vaccination.schedule",
		"dhi.vaccination.site"
	];
permission("user_access.dhi_group_billing", "R", resource) if 
	resource in [
		"dhi.doses.vaccine.detail",
		"dhi.imaging.patient",
		"dhi.imaging.patient.line",
		"dhi.imaging.test",
		"dhi.imaging.test.category",
		"dhi.imaging.test.criteria",
		"dhi.lab.method",
		"dhi.lab.patient",
		"dhi.lab.result",
		"dhi.lab.test",
		"dhi.lab.test.category",
		"dhi.lab.test.criteria",
		"dhi.legacy.brand",
		"dhi.legacy.vaccine.booster",
		"dhi.legacy.vaccine.detail",
		"dhi.legacy.vaccine.template",
		"dhi.ppd.reading",
		"dhi.ppd.vaccine.detail",
		"dhi.sample.taken",
		"dhi.vaccination",
		"dhi.vaccination.category",
		"dhi.vaccination.code",
		"dhi.vaccination.legacy.history.patient",
		"dhi.vaccination.line",
		"dhi.vaccination.patient",
		"dhi.vaccination.variants",
		"dhi.yearly.vaccine.detail"
	];

# user_access.dhi_group_nurse
permission("user_access.dhi_group_nurse", "RWCU", resource) if 
	resource in [
		"dhi.patient.susceptibility.test",
		"dhi.vaccination",
		"dhi.vaccination.booster.schedule",
		"dhi.vaccination.brands",
		"dhi.vaccination.category",
		"dhi.vaccination.code",
		"dhi.vaccination.first.dose",
		"dhi.vaccination.line",
		"dhi.vaccination.schedule",
		"dhi.vaccination.site",
		"dhi.vaccination.variants"
	];
permission("user_access.dhi_group_nurse", "RWC", resource) if 
	resource in [
		"dhi.imaging.patient",
		"dhi.imaging.patient.line",
		"dhi.lab.patient",
		"dhi.lab.patient.line",
		"dhi.sample.taken",
		"dhi.vaccination.patient"
	];
permission("user_access.dhi_group_nurse", "RW", resource) if 
	resource in [
		"dhi.doses.vaccine.detail",
		"dhi.lab.criteria.category",
		"dhi.lab.criteria.category.items",
		"dhi.lab.test.criteria.group",
		"dhi.laboratory.services",
		"dhi.legacy.brand",
		"dhi.legacy.vaccine.booster",
		"dhi.legacy.vaccine.detail",
		"dhi.legacy.vaccine.template",
		"dhi.patient.lab.other.criterias",
		"dhi.ppd.reading",
		"dhi.ppd.vaccine.detail",
		"dhi.susceptibility.test",
		"dhi.vaccination.legacy.history.patient",
		"dhi.yearly.vaccine.detail"
	];
permission("user_access.dhi_group_nurse", "R", resource) if 
	resource in [
		"dhi.imaging.test",
		"dhi.imaging.test.category",
		"dhi.imaging.test.criteria",
		"dhi.lab.method",
		"dhi.lab.result",
		"dhi.lab.test",
		"dhi.lab.test.category",
		"dhi.lab.test.criteria"
	];

# user_access.dhi_group_doctor
permission("user_access.dhi_group_doctor", "RWCU", resource) if 
	resource in [
		"dhi.lab.method",
		"dhi.lab.result",
		"dhi.patient.susceptibility.test",
		"dhi.vaccination",
		"dhi.vaccination.booster.schedule",
		"dhi.vaccination.brands",
		"dhi.vaccination.category",
		"dhi.vaccination.code",
		"dhi.vaccination.first.dose",
		"dhi.vaccination.line",
		"dhi.vaccination.schedule",
		"dhi.vaccination.site",
		"dhi.vaccination.variants"
	];
permission("user_access.dhi_group_doctor", "RWC", resource) if 
	resource in [
		"dhi.imaging.patient",
		"dhi.imaging.patient.line",
		"dhi.lab.patient",
		"dhi.lab.patient.line",
		"dhi.sample.taken",
		"dhi.vaccination.patient"
	];
permission("user_access.dhi_group_doctor", "RW", resource) if 
	resource in [
		"dhi.lab.criteria.category",
		"dhi.lab.criteria.category.items",
		"dhi.lab.test.criteria.group",
		"dhi.laboratory.services",
		"dhi.patient.lab.other.criterias",
		"dhi.susceptibility.test"
	];
permission("user_access.dhi_group_doctor", "R", resource) if 
	resource in [
		"dhi.doses.vaccine.detail",
		"dhi.imaging.test",
		"dhi.imaging.test.category",
		"dhi.imaging.test.criteria",
		"dhi.lab.test",
		"dhi.lab.test.category",
		"dhi.lab.test.criteria",
		"dhi.legacy.brand",
		"dhi.legacy.vaccine.booster",
		"dhi.legacy.vaccine.detail",
		"dhi.legacy.vaccine.template",
		"dhi.ppd.reading",
		"dhi.ppd.vaccine.detail",
		"dhi.vaccination.legacy.history.patient",
		"dhi.yearly.vaccine.detail"
	];

# user_access.dhi_group_inventory
permission("user_access.dhi_group_inventory", "RW", resource) if 
	resource in [
		"dhi.lab.criteria.category",
		"dhi.lab.criteria.category.items",
		"dhi.lab.test.criteria.group",
		"dhi.laboratory.services",
		"dhi.patient.lab.other.criterias",
		"dhi.patient.susceptibility.test",
		"dhi.susceptibility.test"
	];
permission("user_access.dhi_group_inventory", "R", resource) if 
	resource in [
		"dhi.doses.vaccine.detail",
		"dhi.imaging.patient",
		"dhi.imaging.patient.line",
		"dhi.imaging.test",
		"dhi.imaging.test.category",
		"dhi.imaging.test.criteria",
		"dhi.lab.method",
		"dhi.lab.patient",
		"dhi.lab.patient.line",
		"dhi.lab.result",
		"dhi.lab.test",
		"dhi.lab.test.category",
		"dhi.lab.test.criteria",
		"dhi.legacy.brand",
		"dhi.legacy.vaccine.booster",
		"dhi.legacy.vaccine.detail",
		"dhi.legacy.vaccine.template",
		"dhi.ppd.reading",
		"dhi.ppd.vaccine.detail",
		"dhi.sample.taken",
		"dhi.vaccination",
		"dhi.vaccination.booster.schedule",
		"dhi.vaccination.brands",
		"dhi.vaccination.category",
		"dhi.vaccination.first.dose",
		"dhi.vaccination.legacy.history.patient",
		"dhi.vaccination.line",
		"dhi.vaccination.patient",
		"dhi.vaccination.schedule",
		"dhi.vaccination.site",
		"dhi.vaccination.variants",
		"dhi.yearly.vaccine.detail"
	];

# user_access.dhi_group_lab
permission("user_access.dhi_group_lab", "RWCU", resource) if 
	resource in [
		"dhi.lab.criteria.category",
		"dhi.lab.criteria.category.items",
		"dhi.lab.method",
		"dhi.lab.patient",
		"dhi.lab.test",
		"dhi.lab.test.category",
		"dhi.lab.test.criteria",
		"dhi.laboratory.services",
		"dhi.patient.lab.other.criterias",
		"dhi.patient.susceptibility.test",
		"dhi.sample.taken",
		"dhi.susceptibility.test",
		"ir.model.fields"
	];
permission("user_access.dhi_group_lab", "RWC", resource) if 
	resource in [
		"dhi.lab.patient.line",
		"dhi.lab.test.criteria.group",
		"ir.module.module",
		"ir.ui.view"
	];
permission("user_access.dhi_group_lab", "R", resource) if 
	resource in [
		"dhi.doses.vaccine.detail",
		"dhi.imaging.patient",
		"dhi.imaging.patient.line",
		"dhi.imaging.test",
		"dhi.imaging.test.category",
		"dhi.imaging.test.criteria",
		"dhi.legacy.brand",
		"dhi.legacy.vaccine.booster",
		"dhi.legacy.vaccine.detail",
		"dhi.legacy.vaccine.template",
		"dhi.ppd.reading",
		"dhi.ppd.vaccine.detail",
		"dhi.vaccination",
		"dhi.vaccination.booster.schedule",
		"dhi.vaccination.brands",
		"dhi.vaccination.category",
		"dhi.vaccination.first.dose",
		"dhi.vaccination.legacy.history.patient",
		"dhi.vaccination.line",
		"dhi.vaccination.patient",
		"dhi.vaccination.schedule",
		"dhi.vaccination.variants",
		"dhi.yearly.vaccine.detail"
	];

# user_access.dhi_group_imaging
permission("user_access.dhi_group_imaging", "RWCU", resource) if 
	resource in [
		"dhi.imaging.test",
		"dhi.imaging.test.category",
		"dhi.imaging.test.criteria",
		"dhi.lab.method",
		"dhi.lab.result",
		"dhi.sample.taken"
	];
permission("user_access.dhi_group_imaging", "RWC", resource) if 
	resource in [
		"dhi.imaging.patient",
		"dhi.imaging.patient.line",
		"dhi.lab.patient",
		"dhi.lab.patient.line"
	];
permission("user_access.dhi_group_imaging", "RW", resource) if 
	resource in [
		"dhi.lab.criteria.category",
		"dhi.lab.criteria.category.items",
		"dhi.lab.test.criteria.group",
		"dhi.laboratory.services",
		"dhi.patient.lab.other.criterias",
		"dhi.susceptibility.test"
	];
permission("user_access.dhi_group_imaging", "R", resource) if 
	resource in [
		"dhi.doses.vaccine.detail",
		"dhi.lab.test",
		"dhi.lab.test.category",
		"dhi.lab.test.criteria",
		"dhi.legacy.brand",
		"dhi.legacy.vaccine.booster",
		"dhi.legacy.vaccine.detail",
		"dhi.legacy.vaccine.template",
		"dhi.ppd.reading",
		"dhi.ppd.vaccine.detail",
		"dhi.vaccination",
		"dhi.vaccination.booster.schedule",
		"dhi.vaccination.brands",
		"dhi.vaccination.category",
		"dhi.vaccination.first.dose",
		"dhi.vaccination.legacy.history.patient",
		"dhi.vaccination.line",
		"dhi.vaccination.patient",
		"dhi.vaccination.schedule",
		"dhi.vaccination.site",
		"dhi.vaccination.variants",
		"dhi.yearly.vaccine.detail"
	];

# user_access.dhi_group_hr
permission("user_access.dhi_group_hr", "RWCU", resource) if 
	resource in [
		"dhi.imaging.test",
		"dhi.imaging.test.category",
		"dhi.imaging.test.criteria",
		"dhi.lab.method",
		"dhi.lab.result",
		"dhi.lab.test",
		"dhi.lab.test.category",
		"dhi.lab.test.criteria",
		"dhi.sample.taken",
		"dhi.vaccination",
		"dhi.vaccination.booster.schedule",
		"dhi.vaccination.brands",
		"dhi.vaccination.category",
		"dhi.vaccination.code",
		"dhi.vaccination.first.dose",
		"dhi.vaccination.line",
		"dhi.vaccination.schedule",
		"dhi.vaccination.site",
		"dhi.vaccination.variants"
	];
permission("user_access.dhi_group_hr", "RW", resource) if 
	resource in [
		"dhi.lab.criteria.category",
		"dhi.lab.criteria.category.items",
		"dhi.lab.test.criteria.group",
		"dhi.laboratory.services",
		"dhi.patient.lab.other.criterias",
		"dhi.patient.susceptibility.test",
		"dhi.susceptibility.test"
	];
permission("user_access.dhi_group_hr", "R", resource) if 
	resource in [
		"dhi.doses.vaccine.detail",
		"dhi.imaging.patient",
		"dhi.imaging.patient.line",
		"dhi.lab.patient",
		"dhi.lab.patient.line",
		"dhi.legacy.brand",
		"dhi.legacy.vaccine.booster",
		"dhi.legacy.vaccine.detail",
		"dhi.legacy.vaccine.template",
		"dhi.ppd.reading",
		"dhi.ppd.vaccine.detail",
		"dhi.vaccination.legacy.history.patient",
		"dhi.vaccination.patient",
		"dhi.yearly.vaccine.detail"
	];

# user_access.dhi_group_administration
permission("user_access.dhi_group_administration", "RWCU", resource) if 
	resource in [
		"dhi.doses.vaccine.detail",
		"dhi.imaging.patient",
		"dhi.imaging.patient.line",
		"dhi.imaging.test",
		"dhi.imaging.test.category",
		"dhi.imaging.test.criteria",
		"dhi.lab.criteria.category",
		"dhi.lab.criteria.category.items",
		"dhi.lab.method",
		"dhi.lab.patient",
		"dhi.lab.patient.line",
		"dhi.lab.result",
		"dhi.lab.test",
		"dhi.lab.test.category",
		"dhi.lab.test.criteria",
		"dhi.lab.test.criteria.group",
		"dhi.laboratory.services",
		"dhi.legacy.brand",
		"dhi.legacy.vaccine.booster",
		"dhi.legacy.vaccine.detail",
		"dhi.legacy.vaccine.template",
		"dhi.patient.lab.other.criterias",
		"dhi.patient.susceptibility.test",
		"dhi.ppd.reading",
		"dhi.ppd.vaccine.detail",
		"dhi.sample.taken",
		"dhi.susceptibility.test",
		"dhi.vaccination",
		"dhi.vaccination.booster.schedule",
		"dhi.vaccination.brands",
		"dhi.vaccination.category",
		"dhi.vaccination.code",
		"dhi.vaccination.first.dose",
		"dhi.vaccination.legacy.history.patient",
		"dhi.vaccination.line",
		"dhi.vaccination.patient",
		"dhi.vaccination.schedule",
		"dhi.vaccination.site",
		"dhi.vaccination.variants",
		"dhi.yearly.vaccine.detail"
	];

# user_access.dhi_group_super_admin
permission("user_access.dhi_group_super_admin", "RWCU", resource) if 
	resource in [
		"dhi.doses.vaccine.detail",
		"dhi.imaging.patient",
		"dhi.imaging.patient.line",
		"dhi.imaging.test",
		"dhi.imaging.test.category",
		"dhi.imaging.test.criteria",
		"dhi.lab.criteria.category",
		"dhi.lab.criteria.category.items",
		"dhi.lab.method",
		"dhi.lab.patient",
		"dhi.lab.patient.line",
		"dhi.lab.result",
		"dhi.lab.test",
		"dhi.lab.test.category",
		"dhi.lab.test.criteria",
		"dhi.lab.test.criteria.group",
		"dhi.laboratory.services",
		"dhi.legacy.brand",
		"dhi.legacy.vaccine.booster",
		"dhi.legacy.vaccine.detail",
		"dhi.legacy.vaccine.template",
		"dhi.patient.lab.other.criterias",
		"dhi.patient.susceptibility.test",
		"dhi.ppd.reading",
		"dhi.ppd.vaccine.detail",
		"dhi.sample.taken",
		"dhi.susceptibility.test",
		"dhi.vaccination",
		"dhi.vaccination.booster.schedule",
		"dhi.vaccination.brands",
		"dhi.vaccination.category",
		"dhi.vaccination.code",
		"dhi.vaccination.first.dose",
		"dhi.vaccination.legacy.history.patient",
		"dhi.vaccination.line",
		"dhi.vaccination.patient",
		"dhi.vaccination.schedule",
		"dhi.vaccination.site",
		"dhi.vaccination.variants",
		"dhi.yearly.vaccine.detail"
	];
