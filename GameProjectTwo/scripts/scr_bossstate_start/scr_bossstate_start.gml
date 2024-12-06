function scr_bossstate_start() {
	direction = point_direction(x, y, obj_player.x, obj_player.y);
	#region sprite management
	if sprite_index != spr_finalboss_walking {
		sprite_index = spr_finalboss_walking;
	}
	
	if lengthdir_x(1, direction) < 0 { image_xscale = abs(image_xscale) * -1; }
	else { image_xscale = abs(image_xscale); }
	#endregion
	
	#region movement
	// Foot box is moved and enemy moves with it
	var _base_speed = 4;
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
	
	#region switch states
	if x < camera_get_view_x(view_camera[0]) + view_wport {
		state = BOSSSTATE.PHASE1;
		scr_bossstate_phase1();
	}
	#endregion
}