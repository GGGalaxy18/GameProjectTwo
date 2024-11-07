/// @description follow instance
if (instance_exists(instance_to_follow)) {
	if (instance_exists(obj_player)) {
		if (point_distance(x, y, obj_player.x, obj_player.y) > 75)
			mp_potential_step(obj_player.x, obj_player.y, adjusted_speed, false);
	} else {
		
	}
} else { instance_destroy(); }