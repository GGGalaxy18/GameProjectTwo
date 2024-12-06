/// @description follow instance
if (instance_exists(instance_to_follow)) {
	if (instance_exists(obj_player)) {
		if (instance_to_follow.object_index == obj_enemy) {
			if (point_distance(x, y, obj_player.x, obj_player.y) > 75)
				mp_potential_step(obj_player.x, obj_player.y, adjusted_speed, false);
		} 
		else if (instance_to_follow.object_index == obj_flying_enemy) {
			var _scroll_shift = obj_level_controller.cam_scroll;
			if !obj_level_controller.is_scrolling { _scroll_shift = 0; } // redundant but I'm keeping it
			path_shift(fly_path, _scroll_shift, 0);
			if get_to_path {
				var _closest_path_index = 0;
				var _smallest_distance = 500;
				for (var _i=0; _i<num_points*2 + 2; _i++) {
					var _new_distance = point_distance(x, y, path_get_point_x(fly_path, _i), path_get_point_y(fly_path, _i));
					if _new_distance < _smallest_distance {
						_smallest_distance = _new_distance;
						_closest_path_index = _i;
					}
				}
				instance_to_follow.direction = point_direction(x, y, path_get_point_x(fly_path, _closest_path_index), path_get_point_y(fly_path, _closest_path_index));
				mp_potential_step(path_get_point_x(fly_path, _closest_path_index), path_get_point_y(fly_path, _closest_path_index), adjusted_speed, false);
				if x == path_get_point_x(fly_path, _closest_path_index) and y == path_get_point_y(fly_path, _closest_path_index) {
					get_to_path = false;
					path_point_index = _closest_path_index;
				}
			} else { 
				var _max_point_index = num_points*2 + 1;
				instance_to_follow.direction = point_direction(x, y, path_get_point_x(fly_path, path_point_index), path_get_point_y(fly_path, path_point_index));
				mp_potential_step(path_get_point_x(fly_path, path_point_index), path_get_point_y(fly_path, path_point_index), adjusted_speed, false);
				if x == path_get_point_x(fly_path, path_point_index) and y == path_get_point_y(fly_path, path_point_index) {
					path_point_index++;
					if path_point_index > _max_point_index { path_point_index = 0; }
				}
				//mp_potential_step(path_get_point_x(fly_path, path_point_index), path_get_point_y(fly_path, path_point_index), 4, false);
			}
		}
		else if (instance_to_follow.object_index == obj_boss) {
			if obj_boss.state == BOSSSTATE.PHASE3 and obj_boss.smash_attack {
				fly_timer++;
				y = get_arc_altitude(fly_timer/total_fly_time, init_y, 60, end_y);
				x = init_x + (end_x - init_x) * (fly_timer/total_fly_time);

				if fly_timer >= total_fly_time { obj_boss.smash_attack = false; fly_timer = 0; }
			} else {
				mp_potential_step(obj_player.x, obj_player.y, adjusted_speed, false);
			}
		} 
		else if (instance_to_follow.object_index == obj_player) {
			x = obj_player.x;
			y = obj_player.y;
		}
	} else {
		
	}
} else { instance_destroy(); }