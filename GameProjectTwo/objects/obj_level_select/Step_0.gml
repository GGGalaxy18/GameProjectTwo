	if point_distance(obj_player.x, obj_player.y, x, y) < 200 {
		display_interact = true;
	} else { display_interact = false; }

	if display_interact and keyboard_check_released(ord("E")) {
		if !show_map {
			show_map = true;
			set_player_cutscene();
		} else {
			show_map = false;
			set_player_out_cutscene();
		}
	}

	if show_map {
		if keyboard_check_released(vk_escape) {
			show_map = false;
			set_player_out_cutscene();
		}
		
		if mouse_check_button_released(mb_left) {
			if point_distance(mouse_x, mouse_y, camera_get_view_x(view_camera[0]) + view_wport - 42, camera_get_view_y(view_camera[0]) + 66) < 20 {
				show_map = false;
				set_player_out_cutscene();
			}
			
			if point_distance(mouse_x, mouse_y, camera_get_view_x(view_camera[0]) + 600, camera_get_view_y(view_camera[0]) + 300) < 30 {
				room_goto(rm_main);
			}
		}
	}