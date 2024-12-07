if point_distance(obj_player.x, obj_player.y, x, y) < 200 {
	display_interact = true;
} else { display_interact = false; }

if display_interact and keyboard_check_released(ord("E")) {
	change_gun(guns[guns_struct[$ obj_player.equipped_gun]]);
}