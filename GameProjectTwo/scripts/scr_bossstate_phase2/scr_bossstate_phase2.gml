function scr_bossstate_phase2() {
	direction = point_direction(x, y, obj_player.x, obj_player.y);
	#region sprite management
	if acid_spit {
		if sprite_index == spr_finalboss_acid {
			if image_index >= image_number - 1 {
				acid_spit = false;
			}
		} else { acid_spit = false; }
	}
	else if sprite_index != spr_finalboss_walking {
		sprite_index = spr_finalboss_walking;
	}
	
	if lengthdir_x(1, direction) < 0 { image_xscale = abs(image_xscale) * -1; }
	else { image_xscale = abs(image_xscale); }
	#endregion
	
	#region movement
	// Foot box is moved and enemy moves with it
	var _base_speed = 1;
	var _adjusted_speed = _base_speed / 4 * cos(pi * direction/90) + 3 * _base_speed / 4;
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
	
	#region attack
	if can_attack {
		can_attack = false;
		alarm[1] = irandom_range(90, 150);
		
		var _rng = irandom(4);
		switch _rng {
			case 0:
			case 1:
				minion_summon = true;
				alarm[2] = 15;
				var _minion_struct = { "force_right_spawn": true }
				var _minion_rng = irandom(3)
				if _minion_rng == 0 {
					instance_create_layer(x, y, "Instances", obj_enemy, _minion_struct);
				} else { instance_create_layer(x, y, "Instances", obj_flying_enemy, _minion_struct); }
				break;
			case 2:
			case 3:
			case 4:
				sprite_index = spr_finalboss_acid;
				acid_spit = true;
				instance_create_layer(x - 130, y - 470, "Instances", obj_acid_projectile);
				break;
		}
	}
	
	if minion_summon {
		if (alarm[2] > 0) {
			camera_set_view_angle(view_camera[0], -3 + random(5));
		} else {
			camera_set_view_angle(view_camera[0], 0);
			minion_summon = false;
		}
	}
	#endregion
	
	#region switch states
	if hp <= 300 {
		state = BOSSSTATE.PHASE3;
		scr_bossstate_phase3();
	}
	#endregion
}