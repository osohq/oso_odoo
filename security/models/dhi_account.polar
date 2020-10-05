
# group_account_user
permission("group_account_user", "R", resource) if 
	resource = "dhi.product.product";

# dhi_account.group_account_manager
permission("dhi_account.group_account_manager", "RWCU", resource) if 
	resource in [
		"account.account",
		"account.account.template",
		"account.account.type",
		"account.chart.template",
		"account.fiscal.position",
		"account.fiscal.position.account",
		"account.fiscal.position.account.template",
		"account.fiscal.position.tax",
		"account.fiscal.position.tax.template",
		"account.fiscal.position.template",
		"account.fiscal.year",
		"account.group",
		"account.incoterms",
		"account.invoice.report",
		"account.journal",
		"account.journal.group",
		"account.payment.term",
		"account.payment.term.line",
		"account.tax",
		"account.tax.group",
		"account.tax.repartition.line",
		"account.tax.repartition.line.template",
		"account.tax.report.line",
		"account.tax.template",
		"dhi.product.product",
		"dhi.product.template"
	];
permission("dhi_account.group_account_manager", "R", resource) if 
	resource in [
		"account.analytic.line",
		"account.move",
		"account.move.line",
		"account.root",
		"res.partner"
	];

# dhi_account.group_account_user
permission("dhi_account.group_account_user", "RWCU", resource) if 
	resource in [
		"account.account.tag",
		"account.analytic.account",
		"account.bank.statement",
		"account.bank.statement.cashbox",
		"account.bank.statement.line",
		"account.cashbox.line",
		"account.full.reconcile",
		"account.partial.reconcile",
		"account.reconcile.model"
	];
permission("dhi_account.group_account_user", "R", resource) if 
	resource in [
		"account.account",
		"account.account.type",
		"account.fiscal.year",
		"account.group",
		"account.invoice.report",
		"account.journal",
		"account.payment.term",
		"account.payment.term.line",
		"account.root"
	];

# base.group_user
permission("base.group_user", "R", resource) if 
	resource in [
		"account.account",
		"account.analytic.account",
		"account.fiscal.position",
		"account.fiscal.position.account",
		"account.fiscal.position.tax",
		"account.payment.term",
		"account.payment.term.line",
		"account.tax",
		"account.tax.group",
		"account.tax.repartition.line"
	];

# base.group_partner_manager
permission("base.group_partner_manager", "R", resource) if 
	resource = "account.account";

# dhi_account.group_account_invoice
permission("dhi_account.group_account_invoice", "RWCU", resource) if 
	resource in [
		"account.analytic.line",
		"account.cash.rounding",
		"account.full.reconcile",
		"account.move",
		"account.move.line",
		"account.partial.reconcile",
		"account.payment",
		"account.payment.method",
		"account.reconcile.model.template"
	];
permission("dhi_account.group_account_invoice", "RWC", resource) if 
	resource = "account.reconcile.model";
permission("dhi_account.group_account_invoice", "R", resource) if 
	resource in [
		"account.account",
		"account.account.tag",
		"account.account.type",
		"account.bank.statement",
		"account.bank.statement.line",
		"account.invoice.report",
		"account.journal",
		"account.tax",
		"account.tax.group",
		"account.tax.repartition.line",
		"account.tax.report.line"
	];

# base.group_portal
permission("base.group_portal", "R", resource) if 
	resource in [
		"account.move",
		"account.move.line"
	];

# group_account_manager
permission("group_account_manager", "RWCU", resource) if 
	resource in [
		"res.currency",
		"res.currency.rate"
	];
