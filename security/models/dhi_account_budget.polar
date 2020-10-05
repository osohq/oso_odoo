
# dhi_account.group_account_manager
permission("dhi_account.group_account_manager", "R", resource) if 
	resource in [
		"account.budget.post",
		"crossovered.budget"
	];

# dhi_account.group_account_user
permission("dhi_account.group_account_user", "RWCU", resource) if 
	resource in [
		"account.budget.post",
		"crossovered.budget",
		"crossovered.budget.lines"
	];

# base.group_user
permission("base.group_user", "RWC", resource) if 
	resource = "crossovered.budget.lines";
