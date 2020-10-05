
# user_access.dhi_group_receptionist
permission("user_access.dhi_group_receptionist", "RWCU", resource) if 
	resource in [
		"dhi.final.purchase",
		"dhi.final.purchase.line",
		"dhi.inventory.product.return",
		"dhi.inventory.request",
		"dhi.inventory.request.approval.config",
		"dhi.inventory.request.approval.config.line",
		"dhi.inventory.request.line",
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
		"dhi.vendor",
		"purchase.bill.union",
		"purchase.report"
	];
permission("user_access.dhi_group_receptionist", "R", resource) if 
	resource = "dhi.product.purchase.lot";

# user_access.dhi_group_billing
permission("user_access.dhi_group_billing", "RWCU", resource) if 
	resource in [
		"dhi.final.purchase",
		"dhi.final.purchase.line",
		"dhi.inventory.product.return",
		"dhi.inventory.request",
		"dhi.inventory.request.approval.config",
		"dhi.inventory.request.approval.config.line",
		"dhi.inventory.request.line",
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
		"dhi.vendor",
		"purchase.bill.union",
		"purchase.report"
	];
permission("user_access.dhi_group_billing", "R", resource) if 
	resource = "dhi.product.purchase.lot";

# user_access.dhi_group_nurse
permission("user_access.dhi_group_nurse", "RWCU", resource) if 
	resource in [
		"dhi.final.purchase",
		"dhi.final.purchase.line",
		"dhi.inventory.product.return",
		"dhi.inventory.request",
		"dhi.inventory.request.approval.config",
		"dhi.inventory.request.approval.config.line",
		"dhi.inventory.request.line",
		"dhi.product.purchase.lot",
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
		"dhi.vendor",
		"purchase.bill.union",
		"purchase.report"
	];

# user_access.dhi_group_doctor
permission("user_access.dhi_group_doctor", "RWCU", resource) if 
	resource in [
		"dhi.final.purchase",
		"dhi.final.purchase.line",
		"dhi.inventory.product.return",
		"dhi.inventory.request",
		"dhi.inventory.request.approval.config",
		"dhi.inventory.request.approval.config.line",
		"dhi.inventory.request.line",
		"dhi.product.purchase.lot",
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
		"dhi.vendor",
		"purchase.bill.union",
		"purchase.report"
	];

# user_access.dhi_group_inventory
permission("user_access.dhi_group_inventory", "RWCU", resource) if 
	resource in [
		"dhi.final.purchase",
		"dhi.final.purchase.line",
		"dhi.inventory.product.return",
		"dhi.inventory.request",
		"dhi.inventory.request.approval.config",
		"dhi.inventory.request.approval.config.line",
		"dhi.inventory.request.line",
		"dhi.product.purchase.lot",
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
		"dhi.vendor",
		"purchase.bill.union",
		"purchase.report"
	];

# user_access.dhi_group_lab
permission("user_access.dhi_group_lab", "RWCU", resource) if 
	resource in [
		"dhi.final.purchase",
		"dhi.final.purchase.line",
		"dhi.inventory.product.return",
		"dhi.inventory.request",
		"dhi.inventory.request.approval.config",
		"dhi.inventory.request.approval.config.line",
		"dhi.inventory.request.line",
		"dhi.product.purchase.lot",
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
		"dhi.vendor",
		"purchase.bill.union",
		"purchase.report"
	];

# user_access.dhi_group_imaging
permission("user_access.dhi_group_imaging", "RWCU", resource) if 
	resource in [
		"dhi.final.purchase",
		"dhi.final.purchase.line",
		"dhi.inventory.product.return",
		"dhi.inventory.request",
		"dhi.inventory.request.approval.config",
		"dhi.inventory.request.approval.config.line",
		"dhi.inventory.request.line",
		"dhi.product.purchase.lot",
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
		"dhi.vendor",
		"purchase.bill.union",
		"purchase.report"
	];

# user_access.dhi_group_hr
permission("user_access.dhi_group_hr", "RWCU", resource) if 
	resource in [
		"dhi.final.purchase",
		"dhi.final.purchase.line",
		"dhi.inventory.product.return",
		"dhi.inventory.request",
		"dhi.inventory.request.approval.config",
		"dhi.inventory.request.approval.config.line",
		"dhi.inventory.request.line",
		"dhi.product.purchase.lot",
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
		"dhi.vendor",
		"purchase.bill.union",
		"purchase.report"
	];

# user_access.dhi_group_administration
permission("user_access.dhi_group_administration", "RWCU", resource) if 
	resource in [
		"dhi.final.purchase",
		"dhi.final.purchase.line",
		"dhi.inventory.product.return",
		"dhi.inventory.request",
		"dhi.inventory.request.approval.config",
		"dhi.inventory.request.approval.config.line",
		"dhi.inventory.request.line",
		"dhi.product.purchase.lot",
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
		"dhi.vendor",
		"purchase.bill.union",
		"purchase.report"
	];

# user_access.dhi_group_super_admin
permission("user_access.dhi_group_super_admin", "RWCU", resource) if 
	resource in [
		"dhi.final.purchase",
		"dhi.final.purchase.line",
		"dhi.inventory.product.return",
		"dhi.inventory.request",
		"dhi.inventory.request.approval.config",
		"dhi.inventory.request.approval.config.line",
		"dhi.inventory.request.line",
		"dhi.product.purchase.lot",
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
		"dhi.vendor",
		"purchase.bill.union",
		"purchase.report"
	];
