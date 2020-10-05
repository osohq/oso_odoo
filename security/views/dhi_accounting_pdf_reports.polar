allow_menu(_actor, "dhi_accounting_pdf_reports", "view_account_financial_report_form");
allow_menu(_actor, "dhi_accounting_pdf_reports", "view_account_financial_report_tree");
allow_menu(_actor, "dhi_accounting_pdf_reports", "view_account_financial_report_search");
allow_menu(_actor, "dhi_accounting_pdf_reports", "action_account_financial_report_tree");
allow_menu(actor, "dhi_accounting_pdf_reports", "menu_finance_legal_statement") if allow_menu(actor, "dhi_account", "menu_finance_reports");
menu_permission("dhi_account.group_account_user", "dhi_accounting_pdf_reports", resource) if 
	resource in [
		"menu_account_reports",
		"menu_finance_reports_settings"
	];
