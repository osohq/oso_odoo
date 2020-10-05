
# user_access.dhi_group_receptionist
permission("user_access.dhi_group_receptionist", "RWCU", resource) if 
	resource in [
		"dhi.appointment",
		"dhi.appointment.schedule.configuration",
		"dhi.appointment.type",
		"dhi.imaging.request.line",
		"dhi.lab.request.line",
		"dhi.procedure.request.line",
		"dhi.request.line",
		"dhi.vaccination.request.line",
		"mail.followers"
	];
permission("user_access.dhi_group_receptionist", "RWC", resource) if 
	resource = "dhi.request";
permission("user_access.dhi_group_receptionist", "RW", resource) if 
	resource in [
		"dhi.doctor.examination",
		"dhi.doctor.examination.line",
		"dhi.examination.patient",
		"dhi.patient.service"
	];

# user_access.dhi_group_billing
permission("user_access.dhi_group_billing", "RWCU", resource) if 
	resource in [
		"dhi.appointment.schedule.configuration",
		"mail.followers"
	];
permission("user_access.dhi_group_billing", "R", resource) if 
	resource in [
		"dhi.appointment",
		"dhi.appointment.type",
		"dhi.doctor.examination",
		"dhi.doctor.examination.line",
		"dhi.examination.patient",
		"dhi.imaging.request.line",
		"dhi.lab.request.line",
		"dhi.patient.service",
		"dhi.procedure.request.line",
		"dhi.request",
		"dhi.request.line",
		"dhi.vaccination.request.line"
	];

# user_access.dhi_group_nurse
permission("user_access.dhi_group_nurse", "RWCU", resource) if 
	resource in [
		"dhi.appointment",
		"dhi.appointment.schedule.configuration",
		"dhi.appointment.type",
		"dhi.doctor.examination",
		"dhi.doctor.examination.line",
		"dhi.examination.patient",
		"dhi.imaging.request.line",
		"dhi.lab.request.line",
		"dhi.procedure.request.line",
		"dhi.request",
		"dhi.request.line",
		"dhi.vaccination.request.line",
		"mail.followers"
	];
permission("user_access.dhi_group_nurse", "RWC", resource) if 
	resource = "dhi.patient.service";

# user_access.dhi_group_doctor
permission("user_access.dhi_group_doctor", "RWCU", resource) if 
	resource in [
		"dhi.appointment",
		"dhi.appointment.schedule.configuration",
		"dhi.appointment.type",
		"dhi.doctor.examination",
		"dhi.doctor.examination.line",
		"dhi.examination.patient",
		"dhi.imaging.request.line",
		"dhi.lab.request.line",
		"dhi.procedure.request.line",
		"dhi.request",
		"dhi.request.line",
		"dhi.vaccination.request.line",
		"mail.followers"
	];
permission("user_access.dhi_group_doctor", "RWC", resource) if 
	resource = "dhi.patient.service";

# user_access.dhi_group_inventory
permission("user_access.dhi_group_inventory", "RWCU", resource) if 
	resource in [
		"dhi.appointment.schedule.configuration",
		"mail.followers"
	];
permission("user_access.dhi_group_inventory", "R", resource) if 
	resource in [
		"dhi.appointment",
		"dhi.appointment.type",
		"dhi.doctor.examination",
		"dhi.doctor.examination.line",
		"dhi.examination.patient",
		"dhi.imaging.request.line",
		"dhi.lab.request.line",
		"dhi.patient.service",
		"dhi.procedure.request.line",
		"dhi.request",
		"dhi.request.line",
		"dhi.vaccination.request.line"
	];

# user_access.dhi_group_lab
permission("user_access.dhi_group_lab", "RWCU", resource) if 
	resource in [
		"dhi.appointment.schedule.configuration",
		"mail.followers"
	];
permission("user_access.dhi_group_lab", "RWC", resource) if 
	resource in [
		"dhi.appointment",
		"dhi.lab.request.line"
	];
permission("user_access.dhi_group_lab", "R", resource) if 
	resource in [
		"dhi.appointment.type",
		"dhi.doctor.examination",
		"dhi.doctor.examination.line",
		"dhi.examination.patient",
		"dhi.imaging.request.line",
		"dhi.patient.service",
		"dhi.procedure.request.line",
		"dhi.request",
		"dhi.request.line",
		"dhi.vaccination.request.line"
	];

# user_access.dhi_group_imaging
permission("user_access.dhi_group_imaging", "RWCU", resource) if 
	resource in [
		"dhi.appointment.schedule.configuration",
		"mail.followers"
	];
permission("user_access.dhi_group_imaging", "RWC", resource) if 
	resource = "dhi.imaging.request.line";
permission("user_access.dhi_group_imaging", "R", resource) if 
	resource in [
		"dhi.appointment",
		"dhi.appointment.type",
		"dhi.doctor.examination",
		"dhi.doctor.examination.line",
		"dhi.examination.patient",
		"dhi.lab.request.line",
		"dhi.patient.service",
		"dhi.procedure.request.line",
		"dhi.request",
		"dhi.request.line",
		"dhi.vaccination.request.line"
	];

# user_access.dhi_group_hr
permission("user_access.dhi_group_hr", "RWCU", resource) if 
	resource in [
		"dhi.appointment.schedule.configuration",
		"mail.followers"
	];
permission("user_access.dhi_group_hr", "R", resource) if 
	resource in [
		"dhi.appointment",
		"dhi.appointment.type",
		"dhi.doctor.examination",
		"dhi.doctor.examination.line",
		"dhi.examination.patient",
		"dhi.imaging.request.line",
		"dhi.lab.request.line",
		"dhi.patient.service",
		"dhi.procedure.request.line",
		"dhi.request",
		"dhi.request.line",
		"dhi.vaccination.request.line"
	];

# user_access.dhi_group_administration
permission("user_access.dhi_group_administration", "RWCU", resource) if 
	resource in [
		"dhi.appointment",
		"dhi.appointment.schedule.configuration",
		"dhi.appointment.type",
		"dhi.doctor.examination",
		"dhi.doctor.examination.line",
		"dhi.examination.patient",
		"dhi.imaging.request.line",
		"dhi.lab.request.line",
		"dhi.patient.service",
		"dhi.procedure.request.line",
		"dhi.request",
		"dhi.request.line",
		"dhi.vaccination.request.line",
		"mail.followers"
	];

# user_access.dhi_group_super_admin
permission("user_access.dhi_group_super_admin", "RWCU", resource) if 
	resource in [
		"dhi.appointment",
		"dhi.appointment.schedule.configuration",
		"dhi.appointment.type",
		"dhi.doctor.examination",
		"dhi.doctor.examination.line",
		"dhi.examination.patient",
		"dhi.imaging.request.line",
		"dhi.lab.request.line",
		"dhi.patient.service",
		"dhi.procedure.request.line",
		"dhi.request",
		"dhi.request.line",
		"dhi.vaccination.request.line",
		"mail.followers"
	];
