function scr_enemystate_revealed() {
	direction = point_direction(x, y, obj_player.x, obj_player.y);
	#region sprite management
	if sprite_index != spr_enemy_temp {
		sprite_index = spr_enemy_temp;
	}
	
	if lengthdir_x(1, direction) >= 0 { image_xscale = abs(image_xscale) * -1; }
	else { image_xscale = abs(image_xscale); }
	#endregion
	
	#region movement
	// Foot box is moved and enemy moves with it
	var _adjusted_speed = move_speed_revealed / 4 * cos(pi * direction/90) + 3 * move_speed_revealed / 4;
	for (var _i=0; _i<instance_number(obj_foot_hitbox); _i++) {
		var _footbox = instance_find(obj_foot_hitbox, _i);
		with (_footbox) {
			if instance_to_follow == other.id {
				adjusted_speed = _adjusted_speed;
				other.x = x;
				other.y = y;
			}
		}
	}
	#endregion
	
	#region switch states
	if point_distance(x, y - sprite_height/2, obj_player.x, obj_player.y - obj_player.sprite_height/2) >= light_radius {
		state = ENEMYSTATE.SHROUDED;
		scr_enemystate_shrouded();
	}
	#endregion
}