allow_menu(_actor, "dhi_dashboard_analytics", "dhi_dashboard_analytics_action");
allow_menu(_actor, "dhi_dashboard_analytics", "board_form");
allow_menu(_actor, "dhi_dashboard_analytics", "board_tree");
allow_menu(_actor, "dhi_dashboard_analytics", "board_dashboard_action_window");
allow_menu(_actor, "dhi_dashboard_analytics", "board_form_tree_action_window");
allow_menu(_actor, "dhi_dashboard_analytics", "dhi_recover_old_items");
allow_menu(_actor, "dhi_dashboard_analytics", "board_menu_root");
allow_menu(_actor, "dhi_dashboard_analytics", "item");
allow_menu(_actor, "dhi_dashboard_analytics", "dhi_item_search_view");
allow_menu(_actor, "dhi_dashboard_analytics", "item_quick_edit_form_view");
allow_menu(_actor, "dhi_dashboard_analytics", "item_form_view");
allow_menu(_actor, "dhi_dashboard_analytics", "dhi_duplicate_dashboard");
allow_menu(_actor, "dhi_dashboard_analytics", "dhi_move_dashboard");
allow_menu(_actor, "dhi_dashboard_analytics", "item_action_window");
menu_permission("dhi_dashboard_analytics_group_manager", "dhi_dashboard_analytics", resource) if 
	resource = "dashboard_menu";
