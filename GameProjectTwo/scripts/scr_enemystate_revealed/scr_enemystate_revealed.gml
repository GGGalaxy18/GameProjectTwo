function scr_enemystate_revealed() {
	#region normal enemy logic
	if object_index == obj_enemy {
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
			var _not_in_flare = true;
			if instance_exists(obj_flare) {
				for (var _i=0; _i<instance_number(obj_flare); _i++) {
					var _flare = instance_find(obj_flare, _i);
					if point_distance(x, y - sprite_height/2, _flare.x, _flare.y) < flare_radius_multiplier * light_radius {
						_not_in_flare = false;
					}
				}
			}
			if _not_in_flare {
				state = ENEMYSTATE.SHROUDED;
				scr_enemystate_shrouded();
			}
		}
	
		if alarm_get(0) <= 0 and point_distance(x, y - sprite_height/2, obj_player.x, obj_player.y - obj_player.sprite_height/2) < attack_radius {
			alarm[0] = attack_cooldown;
		
			state = ENEMYSTATE.ATTACK;
			scr_enemystate_attack();
		}
		#endregion
	}
	#endregion
	
	#region flying enemy logic
	else if object_index == obj_flying_enemy {
		#region sprite management
		if sprite_index != spr_flying_enemy_temp {
			sprite_index = spr_flying_enemy_temp;
			mask_index = spr_flying_enemy_temp;
		}
	
		if lengthdir_x(1, direction) >= 0 { image_xscale = abs(image_xscale) * -1; }
		else { image_xscale = abs(image_xscale); }
		#endregion
		
		#region movement
		// Foot box is moved and enemy moves with it
		var _move_speed_flying = 5;
		//if lengthdir_x(1, direction) <= 0 { _move_speed_flying -= obj_level_controller.base_camera_scroll; }
		var _adjusted_speed = _move_speed_flying / 4 * cos(pi * direction/90) + 3 * _move_speed_flying / 4;
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
			var _not_in_flare = true;
			if instance_exists(obj_flare) {
				for (var _i=0; _i<instance_number(obj_flare); _i++) {
					var _flare = instance_find(obj_flare, _i);
					if point_distance(x, y - sprite_height/2, _flare.x, _flare.y) < flare_radius_multiplier * light_radius {
						_not_in_flare = false;
					}
				}
			}
			if _not_in_flare {
				state = ENEMYSTATE.SHROUDED;
				scr_enemystate_shrouded();
			}
		}
		
		if alarm_get(0) <= 0 {
			alarm[0] = attack_cooldown;
		
			state = ENEMYSTATE.ATTACK;
			scr_enemystate_attack();
		}
		#endregion
	}
	#endregion
}