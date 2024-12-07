if !in_boss_fight {
	#region camera movement
	var _cam_movement_offset = 500;
	if obj_player.x > camera_get_view_x(view_camera[0]) + view_wport - _cam_movement_offset and camera_get_view_x(view_camera[0]) < current_breakpoint {
		cam_scroll = min(4, obj_player.x - (camera_get_view_x(view_camera[0]) + view_wport - _cam_movement_offset));
		camera_set_view_pos(view_camera[0], min(camera_get_view_x(view_camera[0]) + cam_scroll, current_breakpoint), camera_get_view_y(view_camera[0]));
		is_scrolling = true;
	} else { is_scrolling = false; cam_scroll = 0; }

	obj_player.x = clamp(obj_player.x, camera_get_view_x(view_camera[0]) + 16, camera_get_view_x(view_camera[0]) + view_wport - 16);
	#endregion

	#region enemy spawn
	if enemy_spawn_timer < enemy_spawn_time {
		enemy_spawn_timer++;
	} else {
		enemy_spawn_timer = 0;
		enemy_spawn_time = irandom_range(30, 90);
		var _enemy_type = irandom(1);
		if flying_enemy_breakdown[breakpoint_index] == 0 and _enemy_type == 1 { _enemy_type = 0; }
		switch _enemy_type {
			case 0:
			if enemies_killed[breakpoint_index][$ "default"] + instance_number(obj_enemy) - instance_number(obj_flying_enemy) < default_enemy_breakdown[breakpoint_index] {
				instance_create_layer(x, y, "Instances", obj_enemy);
			}
			break;
	
			case 1:
			if enemies_killed[breakpoint_index][$ "flying"] + instance_number(obj_flying_enemy) < flying_enemy_breakdown[breakpoint_index] {
				instance_create_layer(x, y, "Instances", obj_flying_enemy);
			}
			break;
		}
	}
	#endregion

	#region move to next breakpoint
	if level_breakpoints[breakpoint_index] <= camera_get_view_x(view_camera[0]) {
		if enemies_killed[breakpoint_index][$ "default"] == default_enemy_breakdown[breakpoint_index] and
		   enemies_killed[breakpoint_index][$ "flying"] == flying_enemy_breakdown[breakpoint_index] {
			if breakpoint_index + 1 < array_length(level_breakpoints) {
				breakpoint_index++;
				current_breakpoint = level_breakpoints[breakpoint_index];
			} else { in_boss_fight = true; in_boss_cutscene = true; }
		}
	}
	#endregion
} else {
	if !boss_dead {
		#region camera movement
		if !in_boss_cutscene {
			var _cam_movement_offset = 200;
			if obj_boss.x < camera_get_view_x(view_camera[0]) + view_wport - _cam_movement_offset {
				cam_scroll = min(4, (camera_get_view_x(view_camera[0]) + view_wport - _cam_movement_offset) - obj_boss.x);
				camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) - cam_scroll, camera_get_view_y(view_camera[0]));
				is_scrolling = true;
			} else { is_scrolling = false; cam_scroll = 0; }

			obj_player.x = clamp(obj_player.x, camera_get_view_x(view_camera[0]) + 16, camera_get_view_x(view_camera[0]) + view_wport - 16);
		}
		#endregion
	
		#region enter boss fight (cutscene)
		if in_boss_cutscene {
			if !obj_player.in_cutscene set_player_cutscene();
			if !cutscene_sections[$ "player_stop"] {
				if !stopped_player { alarm[0] = 30; stopped_player = true; }
				if alarm[0] <= 0 {
					cutscene_sections[$ "player_stop"] = true;
					alarm[0] = 15;	// set screenshake timer
				}
			} else if !cutscene_sections[$ "shake1"] {
				if (alarm[0] > 0) {
					camera_set_view_angle(view_camera[0], -3 + random(5));
				} else if !end_shake {
					camera_set_view_angle(view_camera[0], 0);
					end_shake = true;
					alarm[1] = 90;	// gap between screenshakes
				}
				if end_shake and alarm[1] <= 0 {
					cutscene_sections[$ "shake1"] = true;
					end_shake = false;
					alarm[0] = 15;	// set screenshake timer
				}
			} else if !cutscene_sections[$ "shake2"] {
				if (alarm[0] > 0) {
					camera_set_view_angle(view_camera[0], -3 + random(5));
				} else if !end_shake {
					camera_set_view_angle(view_camera[0], 0);
					end_shake = true;
					alarm[1] = 90;	// gap between screenshakes
				}
				if end_shake and alarm[1] <= 0 {
					cutscene_sections[$ "shake2"] = true;
					end_shake = false;
					alarm[0] = 15;	// set screenshake timer
					instance_create_layer(x, y, "Instances", obj_dialog_found_boss);
				}
			} else if !cutscene_sections[$ "shake3"] {
				if (alarm[0] > 0) {
					camera_set_view_angle(view_camera[0], -3 + random(5));
				} else if !end_shake {
					camera_set_view_angle(view_camera[0], 0);
					end_shake = true;
					alarm[1] = 90;	// set delay before starting cam pan
				}
				if end_shake and alarm[1] <= 0 {
					cutscene_sections[$ "shake3"] = true;
					end_shake = false;
					alarm[0] = 150;	// pan duration
				}
			} else if !cutscene_sections[$ "cam_pan_right"] {
				var _pan_distance = 1000;
				if alarm[0] > 0 {
					camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + _pan_distance/150, camera_get_view_y(view_camera[0]));
				} else { cutscene_sections[$ "cam_pan_right"] = true; }
			} else if !cutscene_sections[$ "throw_flare"] {
				if !flare_thrown {
					flare_thrown = true;
					var _flare_struct =  { cutscene_x: camera_get_view_x(view_camera[0]) + view_wport*.75, cutscene_y: 600 }
					instance_create_layer(obj_player.x + 25, (obj_player.y - obj_player.sprite_height/2) - 50, "Instances", obj_flare, _flare_struct);
					alarm[0] = 45;
				}
				if alarm[0] <= 0 {
					instance_create_layer(camera_get_view_x(view_camera[0]) + view_wport*.75 + 20, view_hport - 110, "Instances", obj_boss);
					cutscene_sections[$ "throw_flare"] = true;
					alarm[0] = 60;	// roar duration
				}
			} else if !cutscene_sections[$ "roar"] {
				if (alarm[0] > 0) {
					camera_set_view_angle(view_camera[0], -3 + random(5));
				} else if !end_shake {
					camera_set_view_angle(view_camera[0], 0);
					end_shake = true;
					alarm[1] = 10;	// set delay before starting cam pan
				}
				if end_shake and alarm[1] <= 0 {
					cutscene_sections[$ "roar"] = true;
					end_shake = false;
					alarm[0] = 60;	// pan duration
					instance_create_layer(x, y, "Instances", obj_dialog_boss);
				}
			} else if !cutscene_sections[$ "cam_pan_left"] {
				var _pan_distance = 1000;
				if alarm[0] > 0 {
					camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) - _pan_distance/60, camera_get_view_y(view_camera[0]));
				} else {
					cutscene_sections[$ "cam_pan_left"] = true;
					set_player_out_cutscene();
					in_boss_cutscene = false;
					obj_boss.in_cutscene = false;
				}
			}
		}
		#endregion
	} else {
		#region exit level
		if obj_player.x < camera_get_view_x(view_camera[0]) + 20 or obj_player.x > camera_get_view_x(view_camera[0]) + view_wport - 20 {
			exit_level = true;
		}
		show_debug_message(exit_level)
		if exit_level {
			var _time_to_end_level = 90;
			end_level_timer++;
			if end_level_timer > _time_to_end_level {
				room_goto(rm_hub);
			}
		}
		#endregion
	}
}