if !in_boss_fight {
	#region camera movement
	var _cam_movement_offset = 500;
	if obj_player.x > camera_get_view_x(view_camera[0]) + view_wport - _cam_movement_offset and camera_get_view_x(view_camera[0]) < current_breakpoint {
		cam_scroll = min(4, obj_player.x - (camera_get_view_x(view_camera[0]) + view_wport - _cam_movement_offset));
		camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + cam_scroll, camera_get_view_y(view_camera[0]));
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
	#region camera movement
	#endregion
	
	#region enter boss fight (cutscene)
	if in_boss_cutscene {
		obj_player.in_cutscene = true;
		if !cutscene_sections[$ "player_stop"] {
			alarm[0] = 30;
			if alarm[0] <= 0 {
				cutscene_sections[$ "player_stop"] = true;
				alarm[0] = 15;	// set screenshake timer
			}
		} else if !cutscene_sections[$ "shake1"] {
			if (alarm[0] > -1) {
				camera_set_view_angle(view_camera[0], -3 + random(5));
			} else {
				camera_set_view_angle(view_camera[0], 0);
				alarm[1] = 30;	// gap between screenshakes
			}
			if alarm[1] <= 0 {
				cutscene_sections[$ "shake1"] = true;
				alarm[0] = 15;	// set screenshake timer
			}
		} else if !cutscene_sections[$ "shake2"] {
			if (alarm[0] > -1) {
				camera_set_view_angle(view_camera[0], -3 + random(5));
			} else {
				camera_set_view_angle(view_camera[0], 0);
				alarm[1] = 30;	// gap between screenshakes
			}
			if alarm[1] <= 0 {
				cutscene_sections[$ "shake2"] = true;
				alarm[0] = 15;	// set screenshake timer
			}
		} else if !cutscene_sections[$ "shake3"] {
			if (alarm[0] > -1) {
				camera_set_view_angle(view_camera[0], -3 + random(5));
			} else {
				camera_set_view_angle(view_camera[0], 0);
				alarm[1] = 30;	// gap between screenshakes
			}
			if alarm[1] <= 0 {
				cutscene_sections[$ "shake3"] = true;
			}
		} else if !cutscene_sections[$ "cam_pan_right"] {
			show_debug_message("waiting here for a bit")
		} else if !cutscene_sections[$ "throw_flare"] {
				
		} else if !cutscene_sections[$ "roar"] {
				
		} else if !cutscene_sections[$ "cam_pan_left"] {
				
		}
	}
	#endregion
}