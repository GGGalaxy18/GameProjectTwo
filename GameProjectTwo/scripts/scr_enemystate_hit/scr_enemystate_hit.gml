function scr_enemystate_hit() {
	var _hit_time = 15;
	#region sprite management
	#endregion
	
	#region movement
	// Foot box is moved and enemy moves with it
	var _adjusted_speed = move_speed_revealed / 4 * cos(pi * direction/90) + 3 * move_speed_revealed / 4;
	for (var _i=0; _i<instance_number(obj_foot_hitbox); _i++) {
		var _footbox = instance_find(obj_foot_hitbox, _i);
		with (_footbox) {
			if instance_to_follow == other.id {
				adjusted_speed = _adjusted_speed * other.hit_speed_reduction;
				other.x = x;
				other.y = y;
			}
		}
	}
	#endregion
	
	hit_timer++;
	
	#region switch states
	if hit_timer >= _hit_time {
		hit_timer = 0;
		
		if point_distance(x, y - sprite_height/2, obj_player.x, obj_player.y - obj_player.sprite_height/2) >= light_radius {
			state = ENEMYSTATE.SHROUDED;
			scr_enemystate_shrouded();
		} else { 
			state = ENEMYSTATE.REVEALED;
			scr_enemystate_revealed();
		}
	}
	#endregion
}