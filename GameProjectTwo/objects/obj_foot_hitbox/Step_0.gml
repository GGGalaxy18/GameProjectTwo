/// @description follow instance
if (instance_exists(instance_to_follow)) {
	if (point_distance(x, y, obj_player.x, obj_player.y) > 75)
		mp_potential_step(obj_player.x, obj_player.y, adjusted_speed, false);
} else { instance_destroy(); }