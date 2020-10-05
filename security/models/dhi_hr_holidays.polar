
# user_access.dhi_group_administration
permission("user_access.dhi_group_administration", "RWCU", resource) if 
	resource in [
		"calendar.attendee",
		"calendar.event",
		"calendar.event.type",
		"dhi.hr.leave",
		"dhi.hr.leave.allocation",
		"dhi.hr.leave.type",
		"mail.activity.type",
		"resource.calendar.leaves"
	];
permission("user_access.dhi_group_administration", "R", resource) if 
	resource in [
		"dhi.hr.leave.report",
		"dhi.hr.leave.type"
	];
