/// @description follow instance
if (instance_exists(instance_to_follow)) {
	if (instance_exists(obj_player)) {
		if (instance_to_follow.object_index == obj_enemy) {
			if (point_distance(x, y, obj_player.x, obj_player.y) > 75)
				mp_potential_step(obj_player.x, obj_player.y, adjusted_speed, false);
		} else if (instance_to_follow.object_index == obj_flying_enemy) {
			// TODO: define flying enemy path above player
		}
	} else {
		
	}
} else { instance_destroy(); }