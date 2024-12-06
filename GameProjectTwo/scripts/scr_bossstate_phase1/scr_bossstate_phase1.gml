function scr_bossstate_phase1() {
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
	var _base_speed = 2;
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
		acid_spit = true;
		sprite_index = spr_finalboss_acid;
		alarm[1] = irandom_range(90, 150);
		
		instance_create_layer(x - 130, y - 470, "Instances", obj_acid_projectile);
	}
	#endregion
	
	#region switch states
	if hp <= 600 {
		state = BOSSSTATE.PHASE2;
		scr_bossstate_phase2();
	}
	#endregion
}