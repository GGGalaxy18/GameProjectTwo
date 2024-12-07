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
	
	
}