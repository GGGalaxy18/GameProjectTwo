/// @description enemy tracker

enemies_killed = [{ "default": 0,
					"flying": 0 },
				  { "default": 0,
					"flying": 0 },
				  { "default": 0,
					"flying": 0 },
				  { "default": 0,
					"flying": 0 }];
					
current_breakpoint = level_breakpoints[0];
breakpoint_index = 0;
enemy_spawn_timer = 0;
enemy_spawn_time = 30;

is_scrolling = true;