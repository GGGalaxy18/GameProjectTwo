/// @description tutorial tracker
checkpoint_tasks = [{ "W": false,
					"A": false,
					"S": false,
					"D": false },
				  { "sprint": false },
				  // TODO: ADD DODGE MECHANIC FIRST
				  { "shoot": false,
					"enemy_dead": false },
				  { "grenade": false,
					"enemy_dead": false },
				  { "crate_shot": false,
					"crate_looted": false },
				  { "flare": false,
					"enemy_dead": false },
				  { "heal": false }];
checkpoint_completed = [false, false, false, false, false, false, false];
prev_checkpoint = 0;
checkpoint_index = 0;
related_dialog = [obj_dialog_wasd,		// WASD
				  obj_dialog_sprint,	// SPRINT
				  obj_dialog_shoot,		// SHOOT
				  obj_dialog_grenade,	// GRENADE
				  obj_dialog_crate,		// CRATE
				  obj_dialog_flare,		// FLARE
				  obj_dialog_heal]		// HEAL
instance_create_layer(x, y, "Instances", related_dialog[0]);

cam_scroll = 0;
is_scrolling = false;

// crate check
crate_existed = false;
lowest_grenade = 3;

// health check
lowest_health = 100;

end_level = false;
end_level_timer = 0;