
# user_access.dhi_group_able_to_register_normal_patient
permission("user_access.dhi_group_able_to_register_normal_patient", "RWCU", resource) if 
	resource in [
		"dhi.address",
		"dhi.address.line",
		"dhi.appointment",
		"dhi.bill",
		"dhi.bill.extra.charges",
		"dhi.bill.line",
		"dhi.bill.products.line",
		"dhi.calendar.schedule.event",
		"dhi.coinsurance.amount",
		"dhi.copay.amount",
		"dhi.deductible.amount",
		"dhi.display.category",
		"dhi.district",
		"dhi.emergency_patient_visit",
		"dhi.encounter",
		"dhi.encounter.documents",
		"dhi.evaluation.diagnosis.geosentinel",
		"dhi.evaluation.diagnosis.icd",
		"dhi.fee.schedule",
		"dhi.fee.schedule.line",
		"dhi.fee.schedule.plan",
		"dhi.fee.schedule.plan.category.line",
		"dhi.fee.schedule.plan.line",
		"dhi.fee.schedule.summary.group",
		"dhi.gnp",
		"dhi.gop",
		"dhi.hospital.bed",
		"dhi.hospital.facilities",
		"dhi.hospital.room",
		"dhi.hr.attendance",
		"dhi.hr.contract",
		"dhi.hr.department",
		"dhi.hr.employee",
		"dhi.hr.employee.children",
		"dhi.hr.employee.documents",
		"dhi.hr.employee.education",
		"dhi.hr.employee.training.official",
		"dhi.hr.employee.training.previous",
		"dhi.hr.family.information",
		"dhi.hr.job",
		"dhi.hr.leave",
		"dhi.hr.leave.allocation",
		"dhi.hr.payslip",
		"dhi.imaging.patient",
		"dhi.in_patient_visit",
		"dhi.insurance.bill",
		"dhi.insurance.bill.line",
		"dhi.insurance.card",
		"dhi.invoice",
		"dhi.invoice.line",
		"dhi.invoice.payment",
		"dhi.lab.patient",
		"dhi.out_patient_visit",
		"dhi.patient.allergies",
		"dhi.patient.contact",
		"dhi.patient.demographic_finance",
		"dhi.patient.deposit",
		"dhi.patient.discharge.summary",
		"dhi.patient.evaluation",
		"dhi.patient.expense",
		"dhi.patient.family_contacts",
		"dhi.patient.insurance",
		"dhi.patient.medical_history",
		"dhi.patient.medicine.notes",
		"dhi.patient.notes",
		"dhi.patient.notes.type",
		"dhi.patient.personal_history",
		"dhi.patient.plan.balance",
		"dhi.patient.prescription",
		"dhi.patient.procedure",
		"dhi.patient.service.line",
		"dhi.patient.travel",
		"dhi.patient.travel_history",
		"dhi.patient.vaccination_history",
		"dhi.patient_admission",
		"dhi.patient_check_in",
		"dhi.patient_check_out",
		"dhi.patient_discharge",
		"dhi.patient_visit",
		"dhi.patients",
		"dhi.payment",
		"dhi.payment.adjustment",
		"dhi.payment.deposit.line",
		"dhi.payment.details.line",
		"dhi.payment.invoice.line",
		"dhi.payment.other.payee",
		"dhi.product.product",
		"dhi.request",
		"dhi.state",
		"dhi.temp.patient.address",
		"dhi.vaccination.patient",
		"dhi_dms.directory",
		"dhi_dms.file",
		"ir.module.module",
		"label.print",
		"mrp.bom.service"
	];

# user_access.dhi_group_able_to_schedule/reschedule_appointment
permission("user_access.dhi_group_able_to_schedule/reschedule_appointment", "RWCU", resource) if 
	resource in [
		"dhi.address",
		"dhi.appointment",
		"dhi.bill",
		"dhi.bill.line",
		"dhi.billing.discount.config",
		"dhi.billing.discount.config.line",
		"dhi.calendar.schedule.event",
		"dhi.dummy.invoice",
		"dhi.encounter",
		"dhi.fee.schedule",
		"dhi.fee.schedule.line",
		"dhi.fee.schedule.plan",
		"dhi.hospital.room",
		"dhi.hr.employee",
		"dhi.imaging.patient",
		"dhi.imaging.request.line",
		"dhi.intermediate.payment",
		"dhi.intermediate.payment.adjustment",
		"dhi.intermediate.payment.deposit.line",
		"dhi.intermediate.payment.details.line",
		"dhi.intermediate.payment.invoice.line",
		"dhi.intermediate.payment.other.payee",
		"dhi.invoice",
		"dhi.invoice.line",
		"dhi.lab.patient",
		"dhi.lab.request.line",
		"dhi.opd.config",
		"dhi.opd.config.line",
		"dhi.out_patient_visit",
		"dhi.patient.allergies",
		"dhi.patient.evaluation",
		"dhi.patient.insurance",
		"dhi.patient.medical_history",
		"dhi.patient.mrp.role.fraction",
		"dhi.patient.mrp.role.fraction.line",
		"dhi.patient.personal_history",
		"dhi.patient.plan.balance",
		"dhi.patient.prescription",
		"dhi.patient.procedure",
		"dhi.patient.service",
		"dhi.patient.vaccination_history",
		"dhi.patient_check_in",
		"dhi.patient_visit",
		"dhi.patients",
		"dhi.payment",
		"dhi.payment.details.line",
		"dhi.payment.invoice.line",
		"dhi.procedure.request.line",
		"dhi.request",
		"dhi.vaccination.patient",
		"dhi.vaccination.request.line",
		"ir.actions.server",
		"ir.cron",
		"mrp.bom",
		"res.users"
	];

# user_access.dhi_group_able_to_view_scheduled_appointments
permission("user_access.dhi_group_able_to_view_scheduled_appointments", "R", resource) if 
	resource in [
		"dhi.appointment",
		"dhi.calendar.schedule.event",
		"dhi.hr.department",
		"dhi.imaging.patient",
		"dhi.imaging.request.line",
		"dhi.lab.patient",
		"dhi.lab.request.line",
		"dhi.patient.allergies",
		"dhi.patient.evaluation",
		"dhi.patient.medical_history",
		"dhi.patient.personal_history",
		"dhi.patient.prescription",
		"dhi.patient.procedure",
		"dhi.patient.service",
		"dhi.patient.vaccination_history",
		"dhi.procedure.request.line",
		"dhi.request",
		"dhi.vaccination.patient",
		"dhi.vaccination.request.line"
	];

# user_access.dhi_group_able_to_view_patient_list
permission("user_access.dhi_group_able_to_view_patient_list", "RWCU", resource) if 
	resource in [
		"dhi.address",
		"dhi.address.line",
		"dhi.appointment",
		"dhi.bill",
		"dhi.bill.extra.charges",
		"dhi.bill.line",
		"dhi.bill.products.line",
		"dhi.calendar.schedule.event",
		"dhi.coinsurance.amount",
		"dhi.copay.amount",
		"dhi.deductible.amount",
		"dhi.display.category",
		"dhi.district",
		"dhi.emergency_patient_visit",
		"dhi.encounter",
		"dhi.evaluation.diagnosis.geosentinel",
		"dhi.evaluation.diagnosis.icd",
		"dhi.fee.schedule",
		"dhi.fee.schedule.line",
		"dhi.fee.schedule.plan",
		"dhi.fee.schedule.plan.category.line",
		"dhi.fee.schedule.plan.line",
		"dhi.fee.schedule.summary.group",
		"dhi.gnp",
		"dhi.gop",
		"dhi.hospital.bed",
		"dhi.hospital.facilities",
		"dhi.hospital.room",
		"dhi.hr.attendance",
		"dhi.hr.contract",
		"dhi.hr.department",
		"dhi.hr.employee",
		"dhi.hr.employee.children",
		"dhi.hr.employee.documents",
		"dhi.hr.employee.education",
		"dhi.hr.employee.training.official",
		"dhi.hr.employee.training.previous",
		"dhi.hr.family.information",
		"dhi.hr.job",
		"dhi.hr.leave",
		"dhi.hr.leave.allocation",
		"dhi.hr.payslip",
		"dhi.imaging.patient",
		"dhi.in_patient_visit",
		"dhi.insurance.bill",
		"dhi.insurance.bill.line",
		"dhi.invoice",
		"dhi.invoice.line",
		"dhi.invoice.payment",
		"dhi.lab.patient",
		"dhi.out_patient_visit",
		"dhi.patient.allergies",
		"dhi.patient.contact",
		"dhi.patient.demographic_finance",
		"dhi.patient.deposit",
		"dhi.patient.discharge.summary",
		"dhi.patient.evaluation",
		"dhi.patient.expense",
		"dhi.patient.family_contacts",
		"dhi.patient.insurance",
		"dhi.patient.medical_history",
		"dhi.patient.medicine.notes",
		"dhi.patient.notes",
		"dhi.patient.notes.type",
		"dhi.patient.personal_history",
		"dhi.patient.plan.balance",
		"dhi.patient.prescription",
		"dhi.patient.procedure",
		"dhi.patient.service.line",
		"dhi.patient.travel",
		"dhi.patient.travel_history",
		"dhi.patient.vaccination_history",
		"dhi.patient_admission",
		"dhi.patient_check_in",
		"dhi.patient_check_out",
		"dhi.patient_discharge",
		"dhi.patient_visit",
		"dhi.patients",
		"dhi.payment",
		"dhi.payment.adjustment",
		"dhi.payment.deposit.line",
		"dhi.payment.details.line",
		"dhi.payment.invoice.line",
		"dhi.payment.other.payee",
		"dhi.product.product",
		"dhi.request",
		"dhi.state",
		"dhi.vaccination.patient",
		"dhi_dms.directory",
		"dhi_dms.file",
		"ir.module.module",
		"label.print",
		"label.print.field",
		"mrp.bom.service"
	];

# user_access.dhi_group_able_to_view_list_of_doctor_employees_and_enter_the_schedule_for_doctors
permission("user_access.dhi_group_able_to_view_list_of_doctor_employees_and_enter_the_schedule_for_doctors", "RWCU", resource) if 
	resource in [
		"dhi.calendar.schedule",
		"dhi.calendar.schedule.event",
		"dhi.hr.contract",
		"dhi.hr.employee",
		"dhi.hr.employee.category",
		"dhi.hr.employee.children",
		"dhi.hr.employee.documents",
		"dhi.hr.employee.education",
		"dhi.hr.employee.sub.role",
		"dhi.hr.employee.training.official",
		"dhi.hr.employee.training.previous",
		"dhi.hr.family.information",
		"dhi.hr.payslip",
		"dhi.patients"
	];

# user_access.dhi_group_default_user
permission("user_access.dhi_group_default_user", "RWCU", resource) if 
	resource in [
		"dhi.add.multiple.fraction",
		"dhi.extra.charge.role.fraction",
		"dhi.help",
		"dhi.incident_by",
		"dhi.incident_type",
		"dhi.inventory.request",
		"dhi.inventory.request.line",
		"dhi.mode_of_arrival",
		"dhi.nil_per_os",
		"dhi.sparrow.sms"
	];
permission("user_access.dhi_group_default_user", "RWC", resource) if 
	resource = "dhi.stock.quantity.log";
permission("user_access.dhi_group_default_user", "R", resource) if 
	resource in [
		"dhi.about",
		"dhi.hospital.bed",
		"dhi.hospital.building",
		"dhi.hospital.facilities",
		"dhi.hospital.facilities.type.line",
		"dhi.hospital.location",
		"dhi.hospital.room",
		"dhi.hr.contract",
		"dhi.hr.department",
		"dhi.hr.employee",
		"dhi.hr.employee.children",
		"dhi.hr.employee.documents",
		"dhi.hr.employee.education",
		"dhi.hr.employee.training.official",
		"dhi.hr.employee.training.previous",
		"dhi.hr.family.information",
		"dhi.hr.payslip",
		"dhi.inventory.request.approval.config",
		"dhi.inventory.request.approval.config.line",
		"dhi.patient.age_plan_configuration",
		"dhi.product.product",
		"dhi.product.template",
		"dhi.stock.location",
		"dhi.user.manual",
		"res.lang"
	];

# user_access.dhi_group_able_to_view_hospital_facilities
permission("user_access.dhi_group_able_to_view_hospital_facilities", "R", resource) if 
	resource in [
		"dhi.fee.schedule.line",
		"dhi.hospital.building",
		"dhi.hospital.facilities",
		"dhi.hospital.floor",
		"dhi.hr.department"
	];

# user_access.dhi_group_able_to_create_and_view_product_list
permission("user_access.dhi_group_able_to_create_and_view_product_list", "RWCU", resource) if 
	resource in [
		"dhi.hospital.bed",
		"dhi.hospital.building",
		"dhi.hospital.facilities",
		"dhi.hospital.facilities.type",
		"dhi.hospital.facilities.type.line",
		"dhi.hospital.floor",
		"dhi.hospital.location",
		"dhi.hospital.room",
		"dhi.hospital.room.type",
		"dhi.hr.department",
		"dhi.hr.department.type",
		"dhi.product.attribute",
		"dhi.product.attribute.value",
		"dhi.product.category",
		"dhi.product.dispense.log",
		"dhi.product.packaging",
		"dhi.product.price.history",
		"dhi.product.pricelist",
		"dhi.product.pricelist.item",
		"dhi.product.product",
		"dhi.product.putaway",
		"dhi.product.removal",
		"dhi.product.template",
		"dhi.product.template.attribute.exclusion",
		"dhi.product.template.attribute.line",
		"dhi.product.template.attribute.value",
		"dhi.sales.return",
		"dhi.sales.return.line",
		"dhi.stock.fixed.putaway.strat",
		"dhi.stock.inventory",
		"dhi.stock.inventory.line",
		"dhi.stock.location",
		"dhi.stock.location.route",
		"dhi.stock.move",
		"dhi.stock.move.line",
		"dhi.stock.package_level",
		"dhi.stock.picking",
		"dhi.stock.picking.type",
		"dhi.stock.production.lot",
		"dhi.stock.quant",
		"dhi.stock.quant.package",
		"dhi.stock.quantity",
		"dhi.stock.rule",
		"dhi.stock.scrap",
		"dhi.stock.transfer",
		"dhi.stock.transfer.line",
		"dhi.stock.warehouse",
		"dhi.stock.warehouse.orderpoint"
	];
permission("user_access.dhi_group_able_to_create_and_view_product_list", "R", resource) if 
	resource in [
		"account.tax",
		"dhi.product.purchase.lot",
		"uom.uom"
	];

# user_access.dhi_group_able_to_view_pharmacy_billing_screen
permission("user_access.dhi_group_able_to_view_pharmacy_billing_screen", "RWCU", resource) if 
	resource in [
		"dhi.bill",
		"dhi.bill.extra.charges",
		"dhi.bill.line",
		"dhi.bill.products.line",
		"dhi.encounter",
		"dhi.fee.schedule.line",
		"dhi.fee.schedule.plan",
		"dhi.invoice",
		"dhi.invoice.line",
		"dhi.patient.deposit",
		"dhi.payment",
		"dhi.payment.adjust.config",
		"dhi.payment.adjustment",
		"dhi.payment.details.line",
		"dhi.payment.invoice.line",
		"dhi.pharmacy.detail",
		"dhi.plan.balance.limit",
		"dhi.product.product",
		"dhi.product.purchase.lot",
		"dhi.sales.return",
		"dhi.stock.quantity",
		"ir.sequence"
	];
permission("user_access.dhi_group_able_to_view_pharmacy_billing_screen", "R", resource) if 
	resource in [
		"dhi.patient_visit",
		"dhi.patients",
		"dhi.stock.location"
	];

# user_access.dhi_group_able_to_create_ot_procedure
permission("user_access.dhi_group_able_to_create_ot_procedure", "RWCU", resource) if 
	resource in [
		"dhi.anaesthesia.type",
		"dhi.operation",
		"dhi.ortho.approach",
		"dhi.ot.anaesthetist",
		"dhi.ot.assistant.surgeons",
		"dhi.ot.category",
		"dhi.ot.circulating.nurses",
		"dhi.ot.dj.stent",
		"dhi.ot.operation.list",
		"dhi.ot.scrub.nurses",
		"dhi.ot.skin",
		"dhi.ot.surgeons",
		"dhi.post.ot.diagnosis.icd",
		"dhi.pre.ot.diagnosis.icd",
		"dhi.torniquet.applied"
	];

# user_access.dhi_group_able_to_create_and_view_rfq
permission("user_access.dhi_group_able_to_create_and_view_rfq", "RWCU", resource) if 
	resource in [
		"account.tax",
		"dhi.inventory.request.approval.config",
		"dhi.product.supplierinfo",
		"dhi.purchase.order",
		"dhi.purchase.order.line",
		"dhi.quotation",
		"dhi.quotation.approval",
		"dhi.quotation.approval.line",
		"dhi.quotation.line",
		"dhi.rfq.documents",
		"dhi.vendor",
		"uom.uom"
	];

# user_access.dhi_group_allow_configuration_of_rfq_and_inventory_requests
permission("user_access.dhi_group_allow_configuration_of_rfq_and_inventory_requests", "RWCU", resource) if 
	resource in [
		"dhi.inventory.request.approval.config",
		"dhi.inventory.request.approval.config.line",
		"dhi.quotation.approval",
		"dhi.quotation.approval.line"
	];

# user_access.dhi_group_able_to_create_and_view_purchase_order
permission("user_access.dhi_group_able_to_create_and_view_purchase_order", "RWCU", resource) if 
	resource in [
		"account.account",
		"account.journal",
		"account.move",
		"account.partial.reconcile",
		"account.tax",
		"dhi.facilities.purchase.lot",
		"dhi.final.purchase",
		"dhi.final.purchase.line",
		"dhi.hospital.bed",
		"dhi.hospital.facilities",
		"dhi.inventory.product.return",
		"dhi.inventory.product.return.line",
		"dhi.inventory.request.approval.config",
		"dhi.partner.reference.docs",
		"dhi.po.grn",
		"dhi.po.grn.line",
		"dhi.product.category",
		"dhi.product.price.history",
		"dhi.product.product",
		"dhi.product.purchase.lot",
		"dhi.product.supplierinfo",
		"dhi.purchase.facilities.line",
		"dhi.purchase.order",
		"dhi.purchase.order.documents",
		"dhi.purchase.order.line",
		"dhi.purchase_approval_config",
		"dhi.purchase_approval_config_line",
		"dhi.quotation",
		"dhi.quotation.approval",
		"dhi.quotation.approval.line",
		"dhi.quotation.line",
		"dhi.rfq.documents",
		"dhi.stock.quantity",
		"dhi.vendor",
		"purchase.bill.union",
		"purchase.report",
		"uom.uom"
	];
permission("user_access.dhi_group_able_to_create_and_view_purchase_order", "R", resource) if 
	resource = "dhi.accounts.head.config";

# user_access.dhi_group_able_to_dispense_inventory
permission("user_access.dhi_group_able_to_dispense_inventory", "RWCU", resource) if 
	resource in [
		"dhi.hospital.bed",
		"dhi.hospital.facilities",
		"dhi.product.dispense.log",
		"dhi.product.product",
		"dhi.product.purchase.lot",
		"dhi.stock.quantity"
	];

# user_access.dhi_group_able_to_create_and_view_product_list_of_medicine_category
permission("user_access.dhi_group_able_to_create_and_view_product_list_of_medicine_category", "RWCU", resource) if 
	resource in [
		"dhi.product.attribute",
		"dhi.product.attribute.value",
		"dhi.product.category",
		"dhi.product.packaging",
		"dhi.product.price.history",
		"dhi.product.pricelist",
		"dhi.product.pricelist.item",
		"dhi.product.product",
		"dhi.product.template",
		"dhi.product.template.attribute.exclusion",
		"dhi.product.template.attribute.line",
		"dhi.product.template.attribute.value",
		"dhi.stock.fixed.putaway.strat",
		"dhi.stock.inventory",
		"dhi.stock.inventory.line",
		"dhi.stock.location",
		"dhi.stock.location.route",
		"dhi.stock.move",
		"dhi.stock.move.line",
		"dhi.stock.package_level",
		"dhi.stock.picking",
		"dhi.stock.picking.type",
		"dhi.stock.production.lot",
		"dhi.stock.quant",
		"dhi.stock.quant.package",
		"dhi.stock.quantity",
		"dhi.stock.rule",
		"dhi.stock.scrap",
		"dhi.stock.transfer",
		"dhi.stock.transfer.line",
		"dhi.stock.warehouse",
		"dhi.stock.warehouse.orderpoint"
	];
permission("user_access.dhi_group_able_to_create_and_view_product_list_of_medicine_category", "R", resource) if 
	resource in [
		"account.tax",
		"dhi.product.purchase.lot",
		"uom.uom"
	];

# user_access.dhi_group_able_to_view_employee_list
permission("user_access.dhi_group_able_to_view_employee_list", "R", resource) if 
	resource in [
		"dhi.hr.employee",
		"dhi.hr.employee.category"
	];

# user_access.dhi_group_able_to_view_lab_appointments
permission("user_access.dhi_group_able_to_view_lab_appointments", "RWCU", resource) if 
	resource in [
		"dhi.appointment",
		"dhi.imaging.patient",
		"dhi.imaging.request.line",
		"dhi.lab.patient",
		"dhi.lab.request.line",
		"dhi.patient.allergies",
		"dhi.patient.evaluation",
		"dhi.patient.medical_history",
		"dhi.patient.personal_history",
		"dhi.patient.prescription",
		"dhi.patient.procedure",
		"dhi.patient.service",
		"dhi.patient.vaccination_history",
		"dhi.patient_admission",
		"dhi.procedure.request.line",
		"dhi.request",
		"dhi.susceptibility.test",
		"dhi.vaccination.patient",
		"dhi.vaccination.request.line"
	];

# user_access.dhi_group_able_to_add_results_in_lab_tests
permission("user_access.dhi_group_able_to_add_results_in_lab_tests", "RWCU", resource) if 
	resource in [
		"dhi.bill",
		"dhi.hr.employee.sub.role",
		"dhi.lab.criteria.category.items",
		"dhi.lab.method",
		"dhi.lab.patient.line",
		"dhi.lab.test",
		"dhi.lab.test.category",
		"dhi.lab.test.criteria",
		"dhi.lab.test.criteria.group",
		"dhi.laboratory.services",
		"dhi.patient.lab.other.criterias",
		"dhi.patient.mrp.role.fraction",
		"dhi.patient.mrp.role.fraction.line",
		"dhi.patient.susceptibility.test",
		"dhi.patients",
		"dhi.sample.taken",
		"dhi.susceptibility.test"
	];

# user_access.dhi_group_able_to_view_inpatient_list
permission("user_access.dhi_group_able_to_view_inpatient_list", "RWCU", resource) if 
	resource in [
		"dhi.address",
		"dhi.address.line",
		"dhi.appointment",
		"dhi.bill",
		"dhi.coinsurance.amount",
		"dhi.copay.amount",
		"dhi.deductible.amount",
		"dhi.evaluation.diagnosis.geosentinel",
		"dhi.evaluation.diagnosis.icd",
		"dhi.fee.schedule",
		"dhi.fee.schedule.line",
		"dhi.gop",
		"dhi.imaging.patient",
		"dhi.invoice",
		"dhi.invoice.payment",
		"dhi.lab.patient",
		"dhi.patient.allergies",
		"dhi.patient.contact",
		"dhi.patient.demographic_finance",
		"dhi.patient.deposit",
		"dhi.patient.discharge.summary",
		"dhi.patient.evaluation",
		"dhi.patient.expense",
		"dhi.patient.family_contacts",
		"dhi.patient.insurance",
		"dhi.patient.medical_history",
		"dhi.patient.medicine.notes",
		"dhi.patient.notes",
		"dhi.patient.notes.type",
		"dhi.patient.personal_history",
		"dhi.patient.plan.balance",
		"dhi.patient.prescription",
		"dhi.patient.procedure",
		"dhi.patient.service.line",
		"dhi.patient.travel",
		"dhi.patient.travel_history",
		"dhi.patient.vaccination_history",
		"dhi.patient_admission",
		"dhi.patient_check_out",
		"dhi.patient_visit",
		"dhi.patients",
		"dhi.payment",
		"dhi.payment.invoice.line",
		"dhi.request",
		"dhi.vaccination.patient",
		"dhi_dms.directory",
		"dhi_dms.file",
		"ir.module.module",
		"label.print"
	];

# user_access.dhi_group_able_to_admit_patient
permission("user_access.dhi_group_able_to_admit_patient", "RWCU", resource) if 
	resource in [
		"dhi.address.line",
		"dhi.appointment",
		"dhi.bill",
		"dhi.coinsurance.amount",
		"dhi.copay.amount",
		"dhi.deductible.amount",
		"dhi.district",
		"dhi.encounter",
		"dhi.evaluation.diagnosis.geosentinel",
		"dhi.evaluation.diagnosis.icd",
		"dhi.fee.schedule",
		"dhi.fee.schedule.line",
		"dhi.gnp",
		"dhi.gop",
		"dhi.hospital.bed",
		"dhi.imaging.patient",
		"dhi.in_patient_visit",
		"dhi.invoice.payment",
		"dhi.lab.patient",
		"dhi.patient.allergies",
		"dhi.patient.contact",
		"dhi.patient.demographic_finance",
		"dhi.patient.deposit",
		"dhi.patient.discharge.summary",
		"dhi.patient.evaluation",
		"dhi.patient.expense",
		"dhi.patient.family_contacts",
		"dhi.patient.insurance",
		"dhi.patient.medical_history",
		"dhi.patient.medicine.notes",
		"dhi.patient.notes",
		"dhi.patient.notes.type",
		"dhi.patient.personal_history",
		"dhi.patient.plan.balance",
		"dhi.patient.prescription",
		"dhi.patient.procedure",
		"dhi.patient.service.line",
		"dhi.patient.travel",
		"dhi.patient.travel_history",
		"dhi.patient.vaccination_history",
		"dhi.patient_admission",
		"dhi.patient_check_out",
		"dhi.patient_visit",
		"dhi.patients",
		"dhi.payment",
		"dhi.payment.invoice.line",
		"dhi.product.product",
		"dhi.request",
		"dhi.state",
		"dhi.vaccination.patient",
		"dhi_dms.directory",
		"dhi_dms.file",
		"ir.module.module",
		"label.print"
	];

# user_access.dhi_group_able_to_create_and_view_bills
permission("user_access.dhi_group_able_to_create_and_view_bills", "RWCU", resource) if 
	resource in [
		"account.account.tag",
		"account.tax",
		"account.tax.repartition.line",
		"dhi.address",
		"dhi.appointment",
		"dhi.bill",
		"dhi.bill.extra.charges",
		"dhi.bill.line",
		"dhi.bill.products.line",
		"dhi.billing.discount.config",
		"dhi.billing.discount.config.line",
		"dhi.encounter",
		"dhi.extra.charge",
		"dhi.fee.schedule",
		"dhi.fee.schedule.line",
		"dhi.fee.schedule.line.variants",
		"dhi.fee.schedule.plan",
		"dhi.fee.schedule.plan.category.line",
		"dhi.generate.invoice",
		"dhi.gop",
		"dhi.imaging.request.line",
		"dhi.imaging.test",
		"dhi.insurance.bill",
		"dhi.insurance.bill.line",
		"dhi.invoice",
		"dhi.invoice.line",
		"dhi.lab.request.line",
		"dhi.lab.test",
		"dhi.mrp.role.fraction",
		"dhi.opd.config",
		"dhi.opd.config.line",
		"dhi.patient.insurance",
		"dhi.patient.procedure",
		"dhi.patient.procedure.addon.line",
		"dhi.patient_visit",
		"dhi.patients",
		"dhi.payment",
		"dhi.payment.adjustment",
		"dhi.payment.deposit.line",
		"dhi.payment.details.line",
		"dhi.payment.other.payee",
		"dhi.plan.balance.limit",
		"dhi.procedure.request.line",
		"dhi.product.purchase.lot",
		"dhi.request",
		"dhi.sales.return",
		"dhi.sales.return.line",
		"dhi.vaccination",
		"dhi.vaccination.request.line",
		"ir.actions.report",
		"mrp.bom",
		"mrp.bom.service",
		"mrp.procedure.service.line"
	];

# user_access.dhi_group_able_to_generate_and_view_invoices
permission("user_access.dhi_group_able_to_generate_and_view_invoices", "RWCU", resource) if 
	resource in [
		"dhi.address",
		"dhi.bill",
		"dhi.bill.line",
		"dhi.encounter",
		"dhi.fee.schedule.line",
		"dhi.generate.invoice",
		"dhi.gop",
		"dhi.imaging.role.fraction",
		"dhi.insurance.card",
		"dhi.invoice",
		"dhi.invoice.line",
		"dhi.lab.patient",
		"dhi.lab.role.fraction",
		"dhi.patient.insurance",
		"dhi.patient.mrp.role.fraction",
		"dhi.patient_visit",
		"dhi.patients",
		"dhi.payment",
		"dhi.payment.adjustment",
		"dhi.payment.deposit.line",
		"dhi.payment.details.line",
		"dhi.payment.invoice.line",
		"dhi.payment.other.payee",
		"dhi.vaccination.patient",
		"dhi.vaccination.role.fraction",
		"ir.config_parameter",
		"ir.sequence"
	];

# user_access.dhi_group_able_to_create_and_view_payments
permission("user_access.dhi_group_able_to_create_and_view_payments", "RWCU", resource) if 
	resource in [
		"dhi.address",
		"dhi.bill",
		"dhi.bill.extra.charges",
		"dhi.bill.line",
		"dhi.bill.products.line",
		"dhi.encounter",
		"dhi.fee.schedule.line",
		"dhi.fee.schedule.line.variants",
		"dhi.generate.invoice",
		"dhi.gop",
		"dhi.imaging.test",
		"dhi.invoice",
		"dhi.invoice.line",
		"dhi.lab.test",
		"dhi.patient.insurance",
		"dhi.patient_visit",
		"dhi.patients",
		"dhi.payment",
		"dhi.payment.adjust.config",
		"dhi.payment.adjustment",
		"dhi.payment.deposit.line",
		"dhi.payment.details.line",
		"dhi.payment.invoice.line",
		"dhi.payment.other.payee",
		"dhi.vaccination",
		"mrp.bom",
		"mrp.bom.service"
	];

# user_access.dhi_group_able_to_view_product_list
permission("user_access.dhi_group_able_to_view_product_list", "R", resource) if 
	resource in [
		"account.tax",
		"dhi.product.attribute",
		"dhi.product.attribute.value",
		"dhi.product.category",
		"dhi.product.purchase.lot",
		"dhi.product.template",
		"dhi.product.template.attribute.line",
		"dhi.stock.quantity"
	];

# user_access.dhi_group_able_to_view_credit_pharmaceutical_bills_invoices_and_payments
permission("user_access.dhi_group_able_to_view_credit_pharmaceutical_bills_invoices_and_payments", "R", resource) if 
	resource in [
		"account.account.tag",
		"account.tax",
		"account.tax.repartition.line",
		"dhi.address",
		"dhi.appointment",
		"dhi.billing.discount.config",
		"dhi.billing.discount.config.line",
		"dhi.fee.schedule",
		"dhi.fee.schedule.line",
		"dhi.fee.schedule.line.variants",
		"dhi.fee.schedule.plan.product.line",
		"dhi.generate.invoice",
		"dhi.gop",
		"dhi.imaging.request.line",
		"dhi.imaging.role.fraction",
		"dhi.imaging.test",
		"dhi.lab.patient",
		"dhi.lab.request.line",
		"dhi.lab.role.fraction",
		"dhi.lab.test",
		"dhi.mrp.role.fraction",
		"dhi.opd.config",
		"dhi.opd.config.line",
		"dhi.patient.insurance",
		"dhi.patient.procedure",
		"dhi.payment",
		"dhi.payment.deposit.line",
		"dhi.payment.other.payee",
		"dhi.request",
		"dhi.vaccination",
		"dhi.vaccination.patient",
		"dhi.vaccination.request.line",
		"dhi.vaccination.role.fraction",
		"ir.config_parameter",
		"mrp.bom",
		"mrp.bom.service"
	];

# user_access.dhi_group_able_to_create_procedures
permission("user_access.dhi_group_able_to_create_procedures", "RWCU", resource) if 
	resource in [
		"dhi.anaesthesia.type",
		"dhi.bill.line",
		"dhi.cpt.category",
		"dhi.diagnosis.icd",
		"dhi.fee.schedule.line.variants",
		"dhi.mrp.role.fraction",
		"dhi.opd.config",
		"dhi.opd.config.line",
		"dhi.operation",
		"dhi.ortho.approach",
		"dhi.ot.anaesthetist",
		"dhi.ot.assistant.surgeons",
		"dhi.ot.category",
		"dhi.ot.circulating.nurses",
		"dhi.ot.dj.stent",
		"dhi.ot.operation.list",
		"dhi.ot.position",
		"dhi.ot.scrub.nurses",
		"dhi.ot.surgeons",
		"dhi.patient.mrp.role.fraction",
		"dhi.patient.mrp.role.fraction.line",
		"dhi.patient.procedure.addon.line",
		"dhi.post.ot.diagnosis.icd",
		"dhi.pre.ot.diagnosis.icd",
		"dhi.procedure.variants",
		"dhi.torniquet.applied",
		"mrp.bom",
		"mrp.bom.line",
		"mrp.bom.service.line",
		"mrp.document",
		"mrp.procedure.service.line"
	];

# user_access.dhi_group_able_to_request_lab_imaging_vaccine_procedure_tests
permission("user_access.dhi_group_able_to_request_lab_imaging_vaccine_procedure_tests", "RWCU", resource) if 
	resource in [
		"dhi.imaging.patient.line",
		"dhi.imaging.request.line",
		"dhi.imaging.test",
		"dhi.lab.patient.line",
		"dhi.lab.request.line",
		"dhi.lab.test",
		"dhi.procedure.request.line",
		"dhi.vaccination",
		"dhi.vaccination.request.line",
		"mrp.bom"
	];

# user_access.dhi_group_able_to_create_and_view_prescriptions
permission("user_access.dhi_group_able_to_create_and_view_prescriptions", "RWCU", resource) if 
	resource in [
		"dhi.fee.schedule.plan.product.line",
		"dhi.medicine.administrative.route",
		"dhi.medicine.consumption.frequency",
		"dhi.medicine.consumption.routine",
		"dhi.medicine.form",
		"dhi.patient.prescription",
		"dhi.patient.prescription.line",
		"dhi.stock.quantity"
	];

# user_access.dhi_group_able_to_deposit_and_view_deposited_amount
permission("user_access.dhi_group_able_to_deposit_and_view_deposited_amount", "RWCU", resource) if 
	resource in [
		"dhi.address.line",
		"dhi.appointment",
		"dhi.bill",
		"dhi.coinsurance.amount",
		"dhi.copay.amount",
		"dhi.deductible.amount",
		"dhi.evaluation.diagnosis.geosentinel",
		"dhi.evaluation.diagnosis.icd",
		"dhi.fee.schedule",
		"dhi.fee.schedule.line",
		"dhi.gop",
		"dhi.imaging.patient",
		"dhi.invoice",
		"dhi.invoice.payment",
		"dhi.lab.patient",
		"dhi.patient.allergies",
		"dhi.patient.demographic_finance",
		"dhi.patient.deposit",
		"dhi.patient.discharge.summary",
		"dhi.patient.evaluation",
		"dhi.patient.expense",
		"dhi.patient.family_contacts",
		"dhi.patient.insurance",
		"dhi.patient.medical_history",
		"dhi.patient.medicine.notes",
		"dhi.patient.notes",
		"dhi.patient.personal_history",
		"dhi.patient.plan.balance",
		"dhi.patient.prescription",
		"dhi.patient.procedure",
		"dhi.patient.travel",
		"dhi.patient.travel_history",
		"dhi.patient.vaccination_history",
		"dhi.patient_admission",
		"dhi.patient_visit",
		"dhi.patients",
		"dhi.payment",
		"dhi.payment.invoice.line",
		"dhi.request",
		"dhi.vaccination.patient",
		"dhi_dms.directory",
		"dhi_dms.file",
		"ir.module.module"
	];

# user_access.dhi_group_able_to_create_lab_tests_via_appointment
permission("user_access.dhi_group_able_to_create_lab_tests_via_appointment", "RWCU", resource) if 
	resource in [
		"dhi.bill.line",
		"dhi.encounter",
		"dhi.fee.schedule",
		"dhi.fee.schedule.line",
		"dhi.lab.criteria.category",
		"dhi.lab.department.line",
		"dhi.lab.patient.line",
		"dhi.lab.requisition.configuration",
		"dhi.lab.result",
		"dhi.lab.role.fraction",
		"dhi.lab.test",
		"dhi.out_patient_visit",
		"dhi.patient_check_in",
		"dhi.patient_visit",
		"dhi.patients",
		"dhi.sample.taken",
		"dhi.susceptibility.test",
		"ir.actions.report",
		"ir.actions.server",
		"ir.cron",
		"ir.module.module",
		"label.print",
		"label.print.field"
	];
permission("user_access.dhi_group_able_to_create_lab_tests_via_appointment", "R", resource) if 
	resource in [
		"dhi.fee.schedule.plan",
		"dhi.fee.schedule.plan.category.line",
		"dhi.fee.schedule.plan.line",
		"dhi.opd.config",
		"dhi.patient.insurance",
		"ir.module.module",
		"mrp.bom"
	];

# user_access.dhi_group_able_to_configure_lab_templates
permission("user_access.dhi_group_able_to_configure_lab_templates", "RWCU", resource) if 
	resource in [
		"dhi.analyser",
		"dhi.analyser.test.code",
		"dhi.analyser.test.code.line",
		"dhi.fee.schedule.line",
		"dhi.lab.method",
		"dhi.lab.role.fraction",
		"dhi.lab.test",
		"dhi.lab.test.criteria",
		"dhi.susceptibility.test"
	];
permission("user_access.dhi_group_able_to_configure_lab_templates", "R", resource) if 
	resource = "dhi.fee.schedule.line.variants";

# user_access.dhi_group_able_to_verify_lab_results
permission("user_access.dhi_group_able_to_verify_lab_results", "RWCU", resource) if 
	resource in [
		"dhi.bill",
		"dhi.hr.employee.sub.role",
		"dhi.lab.criteria.category.items",
		"dhi.lab.method",
		"dhi.lab.patient.line",
		"dhi.lab.test",
		"dhi.lab.test.category",
		"dhi.lab.test.criteria",
		"dhi.lab.test.criteria.group",
		"dhi.laboratory.services",
		"dhi.patient.lab.other.criterias",
		"dhi.patient.mrp.role.fraction",
		"dhi.patient.susceptibility.test",
		"dhi.patients",
		"dhi.sample.taken",
		"dhi.susceptibility.test"
	];

# user_access.dhi_group_able_to_add_evaluation_for_patients
permission("user_access.dhi_group_able_to_add_evaluation_for_patients", "RWCU", resource) if 
	resource in [
		"dhi.diagnosis.geosentinel",
		"dhi.diagnosis.icd",
		"dhi.encounter",
		"dhi.evaluation.diagnosis.geosentinel",
		"dhi.evaluation.diagnosis.icd",
		"dhi.patient.evaluation",
		"dhi.patient_visit",
		"dhi.patients"
	];

# user_access.dhi_group_able_to_create_view_edit_and_print_visit_summary_and_medical_report
permission("user_access.dhi_group_able_to_create_view_edit_and_print_visit_summary_and_medical_report", "RWCU", resource) if 
	resource in [
		"dhi.medical.report.config.settings",
		"dhi.medical.report.field.config.settings",
		"dhi.patient.accessories",
		"dhi.patient.discharge.geosentinel_code",
		"dhi.patient.discharge.icd_code",
		"dhi.patient.discharge.operation",
		"dhi.patient.lab.other.criterias",
		"dhi.patient.service",
		"dhi.patient.susceptibility.test",
		"dhi.summary.doctor.request",
		"dhi.summary.imaging.test",
		"dhi.summary.lab.test",
		"dhi.summary.patient.evaluation",
		"dhi.summary.prescription",
		"dhi.summary.procedure",
		"dhi.summary.service",
		"dhi.summary.vaccination",
		"dhi.vaccination.legacy.history.patient",
		"mrp.bom.service"
	];

# user_access.dhi_group_able_to_cancel_appointment
permission("user_access.dhi_group_able_to_cancel_appointment", "RWCU", resource) if 
	resource in [
		"dhi.appointment",
		"dhi.calendar.schedule.event",
		"dhi.encounter",
		"dhi.imaging.patient",
		"dhi.imaging.request.line",
		"dhi.lab.patient",
		"dhi.lab.request.line",
		"dhi.patient.allergies",
		"dhi.patient.evaluation",
		"dhi.patient.medical_history",
		"dhi.patient.personal_history",
		"dhi.patient.prescription",
		"dhi.patient.procedure",
		"dhi.patient.service",
		"dhi.patient.vaccination_history",
		"dhi.patient_visit",
		"dhi.patients",
		"dhi.procedure.request.line",
		"dhi.request",
		"dhi.vaccination.patient",
		"dhi.vaccination.request.line"
	];

# user_access.dhi_group_able_to_check_in_and_pay_bill_through_appointment
permission("user_access.dhi_group_able_to_check_in_and_pay_bill_through_appointment", "RWCU", resource) if 
	resource in [
		"dhi.address",
		"dhi.appointment",
		"dhi.bill",
		"dhi.bill.line",
		"dhi.calendar.schedule.event",
		"dhi.dummy.invoice",
		"dhi.encounter",
		"dhi.fee.schedule",
		"dhi.fee.schedule.line",
		"dhi.fee.schedule.line.variants",
		"dhi.gop",
		"dhi.imaging.patient",
		"dhi.imaging.request.line",
		"dhi.intermediate.payment",
		"dhi.intermediate.payment.adjustment",
		"dhi.intermediate.payment.deposit.line",
		"dhi.intermediate.payment.details.line",
		"dhi.intermediate.payment.invoice.line",
		"dhi.intermediate.payment.other.payee",
		"dhi.invoice",
		"dhi.invoice.line",
		"dhi.lab.patient",
		"dhi.lab.request.line",
		"dhi.opd.config",
		"dhi.opd.config.line",
		"dhi.out_patient_visit",
		"dhi.patient.allergies",
		"dhi.patient.evaluation",
		"dhi.patient.insurance",
		"dhi.patient.medical_history",
		"dhi.patient.mrp.role.fraction",
		"dhi.patient.mrp.role.fraction.line",
		"dhi.patient.personal_history",
		"dhi.patient.prescription",
		"dhi.patient.procedure",
		"dhi.patient.service",
		"dhi.patient.vaccination_history",
		"dhi.patient_check_in",
		"dhi.patient_visit",
		"dhi.patients",
		"dhi.payment",
		"dhi.payment.deposit.line",
		"dhi.payment.details.line",
		"dhi.payment.invoice.line",
		"dhi.plan.balance.limit",
		"dhi.procedure.request.line",
		"dhi.request",
		"dhi.vaccination.patient",
		"dhi.vaccination.request.line",
		"ir.actions.server",
		"ir.config_parameter",
		"ir.cron",
		"mrp.bom"
	];

# user_access.dhi_group_able_to_view_only_consultation_bills_invoices_and_payments
permission("user_access.dhi_group_able_to_view_only_consultation_bills_invoices_and_payments", "RWCU", resource) if 
	resource in [
		"account.account.tag",
		"account.tax",
		"account.tax.repartition.line",
		"dhi.bill",
		"dhi.bill.extra.charges",
		"dhi.bill.line",
		"dhi.bill.products.line",
		"dhi.fee.schedule.line",
		"dhi.fee.schedule.line.variants",
		"dhi.imaging.test",
		"dhi.invoice",
		"dhi.lab.test",
		"dhi.payment",
		"dhi.payment.adjustment",
		"dhi.payment.deposit.line",
		"dhi.payment.details.line",
		"dhi.payment.invoice.line",
		"dhi.payment.other.payee",
		"dhi.vaccination",
		"mrp.bom",
		"mrp.bom.service"
	];

# user_access.dhi_group_create_new_emergency_patient_record
permission("user_access.dhi_group_create_new_emergency_patient_record", "RWCU", resource) if 
	resource in [
		"dhi.district",
		"dhi.emergency_patient_visit",
		"dhi.encounter",
		"dhi.gnp",
		"dhi.gop",
		"dhi.patient.allergies",
		"dhi.patient.contact",
		"dhi.patient.deposit",
		"dhi.patient.family_contacts",
		"dhi.patient.insurance",
		"dhi.patient.medical_history",
		"dhi.patient.notes.type",
		"dhi.patient.personal_history",
		"dhi.patient.service.line",
		"dhi.patient.travel_history",
		"dhi.patient.vaccination_history",
		"dhi.patient_check_out",
		"dhi.patient_visit",
		"dhi.patients",
		"dhi.state",
		"ir.module.module"
	];

# user_access.dhi_group_able_to_un-verify_lab_tests
permission("user_access.dhi_group_able_to_un-verify_lab_tests", "RWCU", resource) if 
	resource in [
		"dhi.bill",
		"dhi.lab.criteria.category.items",
		"dhi.lab.patient.line",
		"dhi.lab.test.criteria",
		"dhi.patient.lab.other.criterias",
		"dhi.patient.mrp.role.fraction",
		"dhi.patient.susceptibility.test",
		"dhi.sample.taken",
		"dhi.susceptibility.test"
	];

# user_access.dhi_group_able_to_view_user_collection_report
permission("user_access.dhi_group_able_to_view_user_collection_report", "RWCU", resource) if 
	resource in [
		"dhi.invoice",
		"dhi.patient.deposit"
	];

# user_access.dhi_group_able_to_create_update_delete_and_archive_employee
permission("user_access.dhi_group_able_to_create_update_delete_and_archive_employee", "RWCU", resource) if 
	resource in [
		"dhi.calendar.schedule",
		"dhi.calendar.schedule.event",
		"dhi.calendar.weekdays",
		"dhi.contract.payslip.line",
		"dhi.employee.insurance.information",
		"dhi.employee.monthly.leave.information",
		"dhi.generate.payslip",
		"dhi.hr.attendance",
		"dhi.hr.contract",
		"dhi.hr.contract.advantage.template",
		"dhi.hr.contract.appraisals",
		"dhi.hr.contract.documents",
		"dhi.hr.contract.type",
		"dhi.hr.contribution.register",
		"dhi.hr.department",
		"dhi.hr.department.type",
		"dhi.hr.employee",
		"dhi.hr.employee.category",
		"dhi.hr.employee.children",
		"dhi.hr.employee.documents",
		"dhi.hr.employee.education",
		"dhi.hr.employee.leaves",
		"dhi.hr.employee.leaves.reject",
		"dhi.hr.employee.sub.role",
		"dhi.hr.employee.training.official",
		"dhi.hr.employee.training.previous",
		"dhi.hr.family.information",
		"dhi.hr.family.relation",
		"dhi.hr.holidays.summary.dept",
		"dhi.hr.holidays.summary.employee",
		"dhi.hr.job",
		"dhi.hr.leave",
		"dhi.hr.leave.allocation",
		"dhi.hr.leave.report",
		"dhi.hr.leave.type",
		"dhi.hr.payroll.structure",
		"dhi.hr.payslip",
		"dhi.hr.payslip.employees",
		"dhi.hr.payslip.input",
		"dhi.hr.payslip.line",
		"dhi.hr.payslip.run",
		"dhi.hr.payslip.worked_days",
		"dhi.hr.rule.input",
		"dhi.hr.salary.rule",
		"dhi.hr.salary.rule.category",
		"dhi.hr.work.location",
		"dhi.monthly.payslip.line",
		"dhi.monthly.payslip.line.detail",
		"dhi.patient.mrp.role.fraction.line",
		"dhi.patients",
		"dhi.payslip.headings",
		"dhi.product.pricelist",
		"dhi.rule.computation.line",
		"dhi.tax.configuration",
		"dhi.tax.configuration.line",
		"ir.actions.act_window",
		"ir.module.category",
		"ir.ui.view",
		"res.groups",
		"res.partner",
		"res.users",
		"resource.resource"
	];

# user_access.dhi_group_able_to_create_employee_schedule
permission("user_access.dhi_group_able_to_create_employee_schedule", "RWCU", resource) if 
	resource in [
		"dhi.appointment",
		"dhi.calendar.schedule",
		"dhi.calendar.schedule.event"
	];

# user_access.dhi_group_enter_emergency_evaluation_form
permission("user_access.dhi_group_enter_emergency_evaluation_form", "RWCU", resource) if 
	resource in [
		"dhi.imaging.request.line",
		"dhi.lab.request.line",
		"dhi.patient.service",
		"dhi.procedure.request.line",
		"dhi.vaccination.request.line",
		"ir.actions.server",
		"ir.cron",
		"uom.uom"
	];

# user_access.dhi_group_able_to_view_legacy_invoices
permission("user_access.dhi_group_able_to_view_legacy_invoices", "RWCU", resource) if 
	resource in [
		"dhi.bill.detail",
		"dhi.bill.master"
	];

# user_access.dhi_group_able_to_configure_vaccination
permission("user_access.dhi_group_able_to_configure_vaccination", "RWCU", resource) if 
	resource in [
		"dhi.fee.schedule",
		"dhi.fee.schedule.line",
		"dhi.vaccination",
		"dhi.vaccination.booster.schedule",
		"dhi.vaccination.brands",
		"dhi.vaccination.category",
		"dhi.vaccination.first.dose",
		"dhi.vaccination.role.fraction",
		"dhi.vaccination.schedule"
	];

# user_access.dhi_group_able_to_create_vaccination_test
permission("user_access.dhi_group_able_to_create_vaccination_test", "RWCU", resource) if 
	resource in [
		"dhi.doses.vaccine.detail",
		"dhi.encounter",
		"dhi.fee.schedule",
		"dhi.fee.schedule.line",
		"dhi.fee.schedule.line.variants",
		"dhi.legacy.vaccine.booster",
		"dhi.legacy.vaccine.detail",
		"dhi.legacy.vaccine.template",
		"dhi.opd.config",
		"dhi.patient.insurance",
		"dhi.patient.mrp.role.fraction",
		"dhi.patient_visit",
		"dhi.patients",
		"dhi.ppd.reading",
		"dhi.ppd.vaccine.detail",
		"dhi.vaccination",
		"dhi.vaccination.booster.schedule",
		"dhi.vaccination.category",
		"dhi.vaccination.code",
		"dhi.vaccination.current.history.patient",
		"dhi.vaccination.first.dose",
		"dhi.vaccination.history.patient",
		"dhi.vaccination.legacy.history.patient",
		"dhi.vaccination.line",
		"dhi.vaccination.patient",
		"dhi.vaccination.schedule",
		"dhi.vaccination.site",
		"dhi.vaccination.variants",
		"dhi.yearly.vaccine.detail"
	];

# user_access.dhi_group_admin_access
permission("user_access.dhi_group_admin_access", "RWCU", resource) if 
	resource in [
		"dhi.diagnosis.geosentinel",
		"dhi.encounter.documents",
		"dhi.extra.charge",
		"dhi.fee.schedule.category",
		"dhi.fee.schedule.plan",
		"dhi.fee.schedule.plan.category.line",
		"dhi.fee.schedule.plan.line",
		"dhi.fee.schedule.plan.product.line",
		"dhi.insurance.card",
		"dhi.partner.reference.docs",
		"dhi.patient.age_plan_configuration",
		"dhi.patient.plan.balance",
		"dhi.plan.balance.limit",
		"dhi.user.manual",
		"dhi_dms.category",
		"dhi_dms.storage",
		"dhi_dms.tag"
	];

# user_access.dhi_group_able_to_create_lab_fractions
permission("user_access.dhi_group_able_to_create_lab_fractions", "RWCU", resource) if 
	resource in [
		"dhi.lab.role.fraction",
		"dhi.patient.mrp.role.fraction",
		"dhi.patient.mrp.role.fraction.line",
		"dhi.payment.fraction"
	];
permission("user_access.dhi_group_able_to_create_lab_fractions", "RW", resource) if 
	resource in [
		"dhi.analyser",
		"dhi.analyser.test.code",
		"dhi.analyser.test.code.line",
		"dhi.lab.patient",
		"dhi.lab.test"
	];
permission("user_access.dhi_group_able_to_create_lab_fractions", "R", resource) if 
	resource in [
		"dhi.bill",
		"dhi.bill.line",
		"dhi.fee.schedule",
		"dhi.hr.job",
		"dhi.lab.criteria.category",
		"dhi.lab.criteria.category.items",
		"dhi.lab.department.line",
		"dhi.lab.method",
		"dhi.lab.patient.line",
		"dhi.lab.request.line",
		"dhi.lab.requisition.configuration",
		"dhi.lab.result",
		"dhi.lab.test.category",
		"dhi.lab.test.criteria",
		"dhi.lab.test.criteria.group",
		"dhi.patient.lab.other.criterias",
		"dhi.patient.susceptibility.test",
		"dhi.patient_admission",
		"dhi.sample.taken",
		"dhi.summary.lab.test"
	];

# user_access.dhi_group_able_to_create_mrp_fractions
permission("user_access.dhi_group_able_to_create_mrp_fractions", "RWCU", resource) if 
	resource in [
		"dhi.bill",
		"dhi.bill.line",
		"dhi.encounter",
		"dhi.mrp.role.fraction",
		"dhi.patient.mrp.role.fraction",
		"dhi.patient.mrp.role.fraction.line",
		"dhi.patient.procedure",
		"dhi.payment.fraction"
	];
permission("user_access.dhi_group_able_to_create_mrp_fractions", "RW", resource) if 
	resource in [
		"dhi.patient.procedure",
		"mrp.bom",
		"mrp.bom.service"
	];
permission("user_access.dhi_group_able_to_create_mrp_fractions", "R", resource) if 
	resource in [
		"dhi.anaesthesia.type",
		"dhi.billing.discount.config.line",
		"dhi.fee.schedule",
		"dhi.fee.schedule.line",
		"dhi.fee.schedule.plan",
		"dhi.fee.schedule.plan.category.line",
		"dhi.fee.schedule.plan.line",
		"dhi.hr.job",
		"dhi.opd.config",
		"dhi.operation",
		"dhi.ortho.approach",
		"dhi.ot.anaesthetist",
		"dhi.ot.assistant.surgeons",
		"dhi.ot.category",
		"dhi.ot.circulating.nurses",
		"dhi.ot.dj.stent",
		"dhi.ot.operation.list",
		"dhi.ot.scrub.nurses",
		"dhi.ot.skin",
		"dhi.ot.surgeons",
		"dhi.patient.insurance",
		"dhi.patient.procedure.addon.line",
		"dhi.patient_visit",
		"dhi.patients",
		"dhi.post.ot.diagnosis.icd",
		"dhi.pre.ot.diagnosis.icd",
		"dhi.procedure.request.line",
		"dhi.torniquet.applied"
	];

# user_access.dhi_group_able_to_create_vaccination_fractions
permission("user_access.dhi_group_able_to_create_vaccination_fractions", "RWCU", resource) if 
	resource in [
		"dhi.encounter",
		"dhi.patient.mrp.role.fraction",
		"dhi.patient.mrp.role.fraction.line",
		"dhi.payment.fraction",
		"dhi.vaccination.role.fraction"
	];
permission("user_access.dhi_group_able_to_create_vaccination_fractions", "RW", resource) if 
	resource in [
		"dhi.vaccination",
		"dhi.vaccination.patient"
	];
permission("user_access.dhi_group_able_to_create_vaccination_fractions", "R", resource) if 
	resource in [
		"dhi.bill",
		"dhi.bill.line",
		"dhi.doses.vaccine.detail",
		"dhi.fee.schedule",
		"dhi.hr.job",
		"dhi.patient.vaccination_history",
		"dhi.ppd.vaccine.detail",
		"dhi.summary.vaccination",
		"dhi.vaccination.booster.schedule",
		"dhi.vaccination.brands",
		"dhi.vaccination.category",
		"dhi.vaccination.code",
		"dhi.vaccination.first.dose",
		"dhi.vaccination.legacy.history.patient",
		"dhi.vaccination.line",
		"dhi.vaccination.request.line",
		"dhi.vaccination.schedule",
		"dhi.vaccination.site",
		"dhi.yearly.vaccine.detail"
	];

# user_access.dhi_group_able_to_create_imaging_fractions
permission("user_access.dhi_group_able_to_create_imaging_fractions", "RWCU", resource) if 
	resource in [
		"dhi.imaging.role.fraction",
		"dhi.patient.mrp.role.fraction",
		"dhi.patient.mrp.role.fraction.line",
		"dhi.payment.fraction"
	];
permission("user_access.dhi_group_able_to_create_imaging_fractions", "RW", resource) if 
	resource in [
		"dhi.imaging.patient",
		"dhi.imaging.test"
	];
permission("user_access.dhi_group_able_to_create_imaging_fractions", "R", resource) if 
	resource in [
		"dhi.bill",
		"dhi.bill.line",
		"dhi.fee.schedule",
		"dhi.hr.job",
		"dhi.imaging.patient.line",
		"dhi.imaging.request.line",
		"dhi.imaging.test.category",
		"dhi.imaging.test.criteria",
		"dhi.patient.mrp.role.fraction",
		"dhi.patient.mrp.role.fraction.line",
		"dhi.summary.imaging.test"
	];

# user_access.dhi_group_able_to_create_imaging_test
permission("user_access.dhi_group_able_to_create_imaging_test", "RWCU", resource) if 
	resource in [
		"dhi.bill",
		"dhi.bill.line",
		"dhi.encounter",
		"dhi.imaging.patient",
		"dhi.imaging.patient.line",
		"dhi.imaging.request.line",
		"dhi.imaging.test",
		"dhi.imaging.test.criteria"
	];
permission("user_access.dhi_group_able_to_create_imaging_test", "R", resource) if 
	resource in [
		"dhi.fee.schedule",
		"dhi.fee.schedule.line",
		"dhi.fee.schedule.line.variants",
		"dhi.fee.schedule.plan",
		"dhi.fee.schedule.plan.category.line",
		"dhi.fee.schedule.plan.line",
		"dhi.imaging.patient.line",
		"dhi.imaging.test",
		"dhi.imaging.test.criteria",
		"dhi.opd.config",
		"dhi.patient.insurance",
		"dhi.patient.mrp.role.fraction",
		"dhi.patient_visit",
		"dhi.patients",
		"mrp.bom"
	];

# user_access.dhi_group_able_to_configure_imaging_test
permission("user_access.dhi_group_able_to_configure_imaging_test", "RWCU", resource) if 
	resource in [
		"dhi.imaging.request.line",
		"dhi.imaging.test",
		"dhi.imaging.test.category",
		"dhi.imaging.test.criteria",
		"uom.uom"
	];
permission("user_access.dhi_group_able_to_configure_imaging_test", "R", resource) if 
	resource = "dhi.imaging.role.fraction";

# user_access.dhi_group_able_to_receive_items_in_pharmacy_sub_store
permission("user_access.dhi_group_able_to_receive_items_in_pharmacy_sub_store", "RWCU", resource) if 
	resource in [
		"dhi.facilities.purchase.lot",
		"dhi.final.purchase",
		"dhi.final.purchase.line",
		"dhi.hospital.bed",
		"dhi.inventory.product.return",
		"dhi.inventory.product.return.line",
		"dhi.po.grn",
		"dhi.product.attribute",
		"dhi.product.attribute.value",
		"dhi.product.product",
		"dhi.product.purchase.lot",
		"dhi.product.template",
		"dhi.product.template.attribute.line",
		"dhi.purchase.order",
		"dhi.purchase.order.line",
		"dhi.quotation",
		"dhi.quotation.line",
		"dhi.rfq.documents",
		"dhi.stock.location",
		"dhi.stock.picking.type",
		"dhi.stock.quantity",
		"dhi.stock.transfer",
		"dhi.stock.transfer.line",
		"dhi.stock.warehouse",
		"dhi.vendor",
		"ir.config_parameter"
	];
permission("user_access.dhi_group_able_to_receive_items_in_pharmacy_sub_store", "R", resource) if 
	resource in [
		"account.journal",
		"account.move",
		"dhi.accounts.head.config",
		"dhi.partner.reference.docs",
		"dhi.po.grn.line",
		"dhi.product.category",
		"dhi.product.supplierinfo",
		"dhi.purchase.facilities.line",
		"dhi.purchase.order.documents"
	];

# user_access.dhi_group_able_to_view_daily_cash_report
permission("user_access.dhi_group_able_to_view_daily_cash_report", "R", resource) if 
	resource in [
		"dhi.invoice",
		"dhi.patient.deposit",
		"dhi.patients",
		"dhi.payment",
		"dhi.payment.deposit.line",
		"dhi.payment.details.line",
		"dhi.payment.invoice.line"
	];

# user_access.dhi_group_able_to_change_bed_of_the_admitted_patient
permission("user_access.dhi_group_able_to_change_bed_of_the_admitted_patient", "R", resource) if 
	resource in [
		"dhi.medical.report.config.settings",
		"dhi.patient.discharge.geosentinel_code",
		"dhi.patient.discharge.icd_code",
		"dhi.summary.doctor.request",
		"dhi.summary.imaging.test",
		"dhi.summary.lab.test",
		"dhi.summary.patient.evaluation",
		"dhi.summary.prescription",
		"dhi.summary.procedure",
		"dhi.summary.service",
		"dhi.summary.vaccination"
	];

# user_access.dhi_group_able_to_create_and_view_temporary_bills_for_admitted_patients
permission("user_access.dhi_group_able_to_create_and_view_temporary_bills_for_admitted_patients", "RWCU", resource) if 
	resource = "dhi.bill";
permission("user_access.dhi_group_able_to_create_and_view_temporary_bills_for_admitted_patients", "R", resource) if 
	resource = "dhi.imaging.test";

# user_access.dhi_group_able_to_receive_items_in_ot_sub_store
permission("user_access.dhi_group_able_to_receive_items_in_ot_sub_store", "R", resource) if 
	resource in [
		"dhi.accounts.head.config",
		"dhi.facilities.purchase.lot",
		"dhi.final.purchase",
		"dhi.final.purchase.line",
		"dhi.hospital.bed",
		"dhi.inventory.product.return",
		"dhi.inventory.product.return.line",
		"dhi.po.grn",
		"dhi.product.attribute",
		"dhi.product.attribute.value",
		"dhi.product.product",
		"dhi.product.purchase.lot",
		"dhi.product.template",
		"dhi.product.template.attribute.line",
		"dhi.purchase.order",
		"dhi.purchase.order.line",
		"dhi.quotation",
		"dhi.quotation.line",
		"dhi.rfq.documents",
		"dhi.stock.location",
		"dhi.stock.picking.type",
		"dhi.stock.quantity",
		"dhi.stock.transfer",
		"dhi.stock.transfer.line",
		"dhi.stock.warehouse",
		"dhi.vendor",
		"ir.config_parameter"
	];

# user_access.dhi_group_able_to_view_all_reports
permission("user_access.dhi_group_able_to_view_all_reports", "RWCU", resource) if 
	resource in [
		"dhi.invoice",
		"dhi.patient.deposit",
		"dhi.patient_discharge",
		"dhi.payment"
	];

# user_access.dhi_group_able_to_receive_items_in_main_store
permission("user_access.dhi_group_able_to_receive_items_in_main_store", "R", resource) if 
	resource = "dhi.accounts.head.config";

# user_access.dhi_group_able_to_configure_procedure
permission("user_access.dhi_group_able_to_configure_procedure", "RWCU", resource) if 
	resource in [
		"dhi.cpt.category",
		"dhi.fee.schedule",
		"dhi.fee.schedule.line",
		"dhi.mrp.role.fraction",
		"mrp.bom"
	];

# user_access.dhi_group_able_to_configure_service
permission("user_access.dhi_group_able_to_configure_service", "RWCU", resource) if 
	resource in [
		"dhi.fee.schedule",
		"dhi.fee.schedule.line",
		"dhi.service.role.fraction",
		"mrp.bom.service",
		"mrp.bom.service.line"
	];

# user_access.dhi_group_able_to_create_service_fractions
permission("user_access.dhi_group_able_to_create_service_fractions", "RWCU", resource) if 
	resource = "dhi.mrp.role.fraction";
