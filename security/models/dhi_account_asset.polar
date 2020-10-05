
# dhi_account.group_account_user
permission("dhi_account.group_account_user", "R", resource) if 
	resource in [
		"account.asset.asset",
		"account.asset.category",
		"account.asset.depreciation.line",
		"asset.asset.report"
	];

# dhi_account.group_account_manager
permission("dhi_account.group_account_manager", "RWCU", resource) if 
	resource in [
		"account.asset.asset",
		"account.asset.category",
		"account.asset.depreciation.line",
		"asset.asset.report"
	];

# dhi_account.group_account_invoice
permission("dhi_account.group_account_invoice", "RWC", resource) if 
	resource in [
		"account.asset.asset",
		"account.asset.depreciation.line"
	];
permission("dhi_account.group_account_invoice", "R", resource) if 
	resource = "account.asset.category";
