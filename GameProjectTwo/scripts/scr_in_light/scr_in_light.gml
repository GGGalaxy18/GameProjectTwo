function check_in_light() {
	var _in_light = false;
	if point_distance(x, y - sprite_height/2, obj_player.x, obj_player.y - obj_player.sprite_height/2) < light_radius {
		_in_light = true;
	}
	if instance_exists(obj_flare) {
		for (var _i=0; _i<instance_number(obj_flare); _i++) {
			var _flare = instance_find(obj_flare, _i);
			if point_distance(x, y - sprite_height/2, _flare.x, _flare.y - 30) < flare_radius_multiplier * light_radius {
				_in_light = true;
			}
		}
	}
	if instance_exists(obj_temp_explosion) {
		for (var _i=0; _i<instance_number(obj_temp_explosion); _i++) {
			var _explosion = instance_find(obj_temp_explosion, _i);
			if point_distance(x, y - sprite_height/2, _explosion.x, _explosion.y - 200) < 1.5 * light_radius {
				_in_light = true;
			}
		}
	}
	return _in_light;
}