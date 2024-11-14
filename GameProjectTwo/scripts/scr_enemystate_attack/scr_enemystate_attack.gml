function scr_enemystate_attack() {
	direction = point_direction(x, y, obj_player.x, obj_player.y);
	var _attack_time = 30;
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
	
	attack_timer++;
	#region switch states
	if attack_timer >= _attack_time {
		attack_timer = 0;
		
		// TODO Move this code around
		if (obj_player.alarm[0] <= 0) {
			hit_player(1);
			obj_player.alarm[0] = obj_player.take_dmg_cooldown;
		}
		
		if point_distance(x, y - sprite_height/2, obj_player.x, obj_player.y - obj_player.sprite_height/2) >= light_radius {
			var _not_in_flare = true;
			if instance_exists(obj_flare) {
				for (var _i=0; _i<instance_number(obj_flare); _i++) {
					var _flare = instance_find(obj_flare, _i);
					if point_distance(x, y - sprite_height/2, _flare.x, _flare.y) < .54 * light_radius {
						_not_in_flare = false;
					}
				}
			}
			if _not_in_flare {
				state = ENEMYSTATE.SHROUDED;
				scr_enemystate_shrouded();
			}
		}
		
		
		if point_distance(x, y - sprite_height/2, obj_player.x, obj_player.y - obj_player.sprite_height/2) < light_radius {
			state = ENEMYSTATE.REVEALED;
			scr_enemystate_revealed()
		} else if instance_exists(obj_flare) {
			for (var _i=0; _i<instance_number(obj_flare); _i++) {
				var _flare = instance_find(obj_flare, _i);
				if point_distance(x, y - sprite_height/2, _flare.x, _flare.y) < .54 * light_radius {
					state = ENEMYSTATE.REVEALED;
					scr_enemystate_revealed()
				}
			}
		}
	}
	#endregion
}