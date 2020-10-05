
# base.group_portal
permission("base.group_portal", "RWCU", resource) if 
	resource in [
		"dhi.sparrow.sms",
		"dhi.telemedicine.payment",
		"ir.actions.server",
		"ir.cron",
		"mail.message",
		"mail.notification",
		"mail.template"
	];
permission("base.group_portal", "RWC", resource) if 
	resource in [
		"dhi.address",
		"dhi.appointment",
		"dhi.encounter",
		"dhi.notification",
		"dhi.patients",
		"dhi.telemedicine",
		"ir.actions.server",
		"ir.cron",
		"ir.sequence",
		"res.partner",
		"res.users"
	];
permission("base.group_portal", "R", resource) if 
	resource in [
		"account.move",
		"dhi.calendar.schedule.event",
		"dhi.hospital.location",
		"dhi.hospital.room",
		"dhi.hr.department",
		"dhi.hr.employee",
		"dhi.imaging.request.line",
		"dhi.lab.request.line",
		"dhi.patient_visit",
		"dhi.procedure.request.line",
		"dhi.purchase.order",
		"dhi.request",
		"dhi.request.line",
		"dhi.vaccination.request.line",
		"ir.model"
	];

# user_access.dhi_group_doctor
permission("user_access.dhi_group_doctor", "RWCU", resource) if 
	resource = "dhi.telemedicine";
