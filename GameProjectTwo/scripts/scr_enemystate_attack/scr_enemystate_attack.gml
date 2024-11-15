function scr_enemystate_attack() {
	#region normal enemy logic
	if object_index == obj_enemy {
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
		
			if !check_in_light() {
				state = ENEMYSTATE.SHROUDED;
				scr_enemystate_shrouded();
			}
		
		
			if check_in_light() {
				state = ENEMYSTATE.REVEALED;
				scr_enemystate_revealed()
			}
		}
		#endregion
	}
	#endregion
	
	#region flying enemy logic
	else if object_index == obj_flying_enemy {
		var _attack_time = 10;
		#region sprite management
		if sprite_index != spr_flying_enemy_temp {
			sprite_index = spr_flying_enemy_temp;
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
	
		attack_timer++;
		#region switch states
		if attack_timer >= _attack_time {
			attack_timer = 0;
			
			// throw projectile
			instance_create_layer(x - 30*image_xscale, y - 10, "Instances", obj_acid_projectile);
		
			if !check_in_light() {
				state = ENEMYSTATE.SHROUDED;
				scr_enemystate_shrouded();
			}
		
		
			if check_in_light() {
				state = ENEMYSTATE.REVEALED;
				scr_enemystate_revealed()
			}
		}
		#endregion
	}
	#endregion
}