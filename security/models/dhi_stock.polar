
# user_access.dhi_group_administration
permission("user_access.dhi_group_administration", "RWCU", resource) if 
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
		"dhi.product.packaging",
		"dhi.product.price.history",
		"dhi.product.pricelist",
		"dhi.product.pricelist.item",
		"dhi.product.product",
		"dhi.product.supplierinfo",
		"dhi.product.template",
		"dhi.product.template.attribute.exclusion",
		"dhi.product.template.attribute.line",
		"dhi.product.template.attribute.value",
		"dhi.stock.location",
		"dhi.stock.location.route",
		"dhi.stock.move",
		"dhi.stock.quant",
		"dhi.stock.warehouse",
		"dhi.stock.warehouse.orderpoint"
	];

# user_access.dhi_group_hr
permission("user_access.dhi_group_hr", "RWCU", resource) if 
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
		"dhi.stock.location",
		"dhi.stock.location.route",
		"dhi.stock.move",
		"dhi.stock.quant",
		"dhi.stock.warehouse",
		"dhi.stock.warehouse.orderpoint"
	];
permission("user_access.dhi_group_hr", "RWC", resource) if 
	resource in [
		"dhi.product.attribute",
		"dhi.product.attribute.value",
		"dhi.product.category",
		"dhi.product.packaging",
		"dhi.product.price.history",
		"dhi.product.pricelist",
		"dhi.product.pricelist.item",
		"dhi.product.product",
		"dhi.product.supplierinfo",
		"dhi.product.template",
		"dhi.product.template.attribute.exclusion",
		"dhi.product.template.attribute.line",
		"dhi.product.template.attribute.value"
	];

# user_access.dhi_group_lab
permission("user_access.dhi_group_lab", "RWCU", resource) if 
	resource in [
		"dhi.stock.location",
		"dhi.stock.location.route",
		"dhi.stock.move",
		"dhi.stock.quant",
		"dhi.stock.warehouse",
		"dhi.stock.warehouse.orderpoint"
	];
permission("user_access.dhi_group_lab", "R", resource) if 
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
		"dhi.product.packaging",
		"dhi.product.price.history",
		"dhi.product.pricelist",
		"dhi.product.pricelist.item",
		"dhi.product.product",
		"dhi.product.supplierinfo",
		"dhi.product.template",
		"dhi.product.template.attribute.exclusion",
		"dhi.product.template.attribute.line",
		"dhi.product.template.attribute.value"
	];

# user_access.dhi_group_super_admin
permission("user_access.dhi_group_super_admin", "RWCU", resource) if 
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
		"dhi.product.packaging",
		"dhi.product.price.history",
		"dhi.product.pricelist",
		"dhi.product.pricelist.item",
		"dhi.product.product",
		"dhi.product.supplierinfo",
		"dhi.product.template",
		"dhi.product.template.attribute.exclusion",
		"dhi.product.template.attribute.line",
		"dhi.product.template.attribute.value",
		"dhi.stock.location",
		"dhi.stock.location.route",
		"dhi.stock.move",
		"dhi.stock.quant",
		"dhi.stock.warehouse",
		"dhi.stock.warehouse.orderpoint"
	];

# user_access.dhi_group_receptionist
permission("user_access.dhi_group_receptionist", "RWCU", resource) if 
	resource in [
		"dhi.stock.location",
		"dhi.stock.location.route",
		"dhi.stock.move",
		"dhi.stock.quant",
		"dhi.stock.warehouse",
		"dhi.stock.warehouse.orderpoint"
	];
permission("user_access.dhi_group_receptionist", "RWC", resource) if 
	resource in [
		"dhi.hospital.bed",
		"dhi.product.product"
	];
permission("user_access.dhi_group_receptionist", "R", resource) if 
	resource in [
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
		"dhi.product.packaging",
		"dhi.product.price.history",
		"dhi.product.pricelist",
		"dhi.product.pricelist.item",
		"dhi.product.supplierinfo",
		"dhi.product.template",
		"dhi.product.template.attribute.exclusion",
		"dhi.product.template.attribute.line",
		"dhi.product.template.attribute.value"
	];

# user_access.dhi_group_imaging
permission("user_access.dhi_group_imaging", "RWCU", resource) if 
	resource in [
		"dhi.stock.location",
		"dhi.stock.location.route",
		"dhi.stock.move",
		"dhi.stock.quant",
		"dhi.stock.warehouse",
		"dhi.stock.warehouse.orderpoint"
	];
permission("user_access.dhi_group_imaging", "R", resource) if 
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
		"dhi.product.packaging",
		"dhi.product.price.history",
		"dhi.product.pricelist",
		"dhi.product.pricelist.item",
		"dhi.product.product",
		"dhi.product.supplierinfo",
		"dhi.product.template",
		"dhi.product.template.attribute.exclusion",
		"dhi.product.template.attribute.line",
		"dhi.product.template.attribute.value"
	];

# user_access.dhi_group_billing
permission("user_access.dhi_group_billing", "RWCU", resource) if 
	resource in [
		"dhi.stock.location",
		"dhi.stock.location.route",
		"dhi.stock.move",
		"dhi.stock.quant",
		"dhi.stock.warehouse",
		"dhi.stock.warehouse.orderpoint"
	];
permission("user_access.dhi_group_billing", "R", resource) if 
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
		"dhi.product.packaging",
		"dhi.product.price.history",
		"dhi.product.pricelist",
		"dhi.product.pricelist.item",
		"dhi.product.product",
		"dhi.product.supplierinfo",
		"dhi.product.template",
		"dhi.product.template.attribute.exclusion",
		"dhi.product.template.attribute.line",
		"dhi.product.template.attribute.value"
	];

# user_access.dhi_group_nurse
permission("user_access.dhi_group_nurse", "RWCU", resource) if 
	resource in [
		"dhi.stock.location",
		"dhi.stock.location.route",
		"dhi.stock.move",
		"dhi.stock.quant",
		"dhi.stock.warehouse",
		"dhi.stock.warehouse.orderpoint"
	];
permission("user_access.dhi_group_nurse", "RW", resource) if 
	resource = "dhi.hospital.bed";
permission("user_access.dhi_group_nurse", "R", resource) if 
	resource in [
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
		"dhi.product.packaging",
		"dhi.product.price.history",
		"dhi.product.pricelist",
		"dhi.product.pricelist.item",
		"dhi.product.product",
		"dhi.product.supplierinfo",
		"dhi.product.template",
		"dhi.product.template.attribute.exclusion",
		"dhi.product.template.attribute.line",
		"dhi.product.template.attribute.value"
	];

# user_access.dhi_group_doctor
permission("user_access.dhi_group_doctor", "RWCU", resource) if 
	resource in [
		"dhi.stock.location",
		"dhi.stock.location.route",
		"dhi.stock.move",
		"dhi.stock.quant",
		"dhi.stock.warehouse",
		"dhi.stock.warehouse.orderpoint"
	];
permission("user_access.dhi_group_doctor", "RW", resource) if 
	resource = "dhi.hospital.bed";
permission("user_access.dhi_group_doctor", "R", resource) if 
	resource in [
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
		"dhi.product.packaging",
		"dhi.product.price.history",
		"dhi.product.pricelist",
		"dhi.product.pricelist.item",
		"dhi.product.product",
		"dhi.product.supplierinfo",
		"dhi.product.template",
		"dhi.product.template.attribute.exclusion",
		"dhi.product.template.attribute.line",
		"dhi.product.template.attribute.value"
	];

# user_access.dhi_group_inventory
permission("user_access.dhi_group_inventory", "RWCU", resource) if 
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
		"dhi.product.packaging",
		"dhi.product.pricelist",
		"dhi.product.pricelist.item",
		"dhi.product.product",
		"dhi.product.supplierinfo",
		"dhi.product.template",
		"dhi.product.template.attribute.exclusion",
		"dhi.product.template.attribute.line",
		"dhi.product.template.attribute.value",
		"dhi.stock.location",
		"dhi.stock.location.route",
		"dhi.stock.move",
		"dhi.stock.quant",
		"dhi.stock.warehouse",
		"dhi.stock.warehouse.orderpoint"
	];
