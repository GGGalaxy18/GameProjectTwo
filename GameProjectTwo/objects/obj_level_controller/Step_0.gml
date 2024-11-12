#region camera movement
if camera_get_view_x(view_camera[0]) <= current_breakpoint {
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + base_camera_scroll, camera_get_view_y(view_camera[0]));
	is_scrolling = true;
} else is_scrolling = false;

obj_player.x = clamp(obj_player.x, camera_get_view_x(view_camera[0]) + 16, camera_get_view_x(view_camera[0]) + view_wport - 16);
#endregion

#region enemy spawn
if enemy_spawn_timer < enemy_spawn_time {
	enemy_spawn_timer++;
} else {
	enemy_spawn_timer = 0;
	enemy_spawn_time = irandom_range(15, 45);
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
			show_debug_message("breakpoint")
		}
	}
}
#endregion