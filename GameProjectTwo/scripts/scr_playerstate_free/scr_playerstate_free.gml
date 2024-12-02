function scr_playerstate_free() {
	#region Movement management
	if ((xdir != 0) or (ydir != 0)) {
		direction = point_direction(0, 0, xdir * hmove_speed, ydir * vmove_speed);	// Sets direction of player
		x += lengthdir_x(abs(xdir), direction) * hmove_speed;
		y += lengthdir_y(abs(ydir), direction) * vmove_speed;
		x = clamp(x, camera_get_view_x(view_camera[0]) + 16, camera_get_view_x(view_camera[0]) + view_wport - 16);
		y = clamp(y, 416, room_height);
		
		if (sprint) {
			if stamina > sprint_consumption {
				x += sprint_additive * xdir;
				y += sprint_additive * ydir;
				var _speed_increase_percent = sqrt(sqr(xdir*(hmove_speed + sprint_additive)) + sqr(ydir*(vmove_speed +  sprint_additive))) / hmove_speed;
				image_speed = _speed_increase_percent;
				stamina -= sprint_consumption;
				recharge_delay_timer = 0;
			}
		} else { image_speed = 1;
			audio_stop_sound(snd_player_sprint)
			
			}
	}
	if recharge_delay_timer >= recharge_delay {
		stamina += stamina_recharge;
		stamina = clamp(stamina, 0, max_stamina);
	}
	recharge_delay_timer++;
	#endregion
	// TODO: dodge/jump
	#region Throw grenade
	if grenade and grenade_timer > 30 and cur_grenades > 0 {
		instance_create_layer(obj_player.x + 25, (obj_player.y - obj_player.sprite_height/2) - 50, "Instances", obj_grenade);
		grenade_timer = 0;
		cur_grenades--;
	}
	grenade_timer++;
	#endregion
	
	#region Idle sprite management (W sprites are flipped)
	if (xdir == 0) and (ydir == 0) {
		// set E sprite
		sprite_index = spr_player;
		if (xdir < 0) {						// Facing West
			image_xscale = -1 * abs(image_xscale);	// Set sprite to face left
		} else if (xdir > 0) {				// Facing East
			image_xscale = 1 * abs(image_xscale);	// Set sprite to face right
		}
	}
	#endregion
	#region Walking sprite management (W sprites are flipped)
	else {
		// set E sprite
		sprite_index = spr_playerwalking;
		if (xdir < 0) {						// Facing West
			image_xscale = -1 * abs(image_xscale);	// Set sprite to face left
		} else if (xdir > 0) {				// Facing East
			image_xscale = 1 * abs(image_xscale);	// Set sprite to face right
		}
	}
	#endregion
	
	#region State switch
	// Switch to reload state
	if (reload and current_magazine < max_magazine[$ equipped_gun]) {
		state = PLAYERSTATE.RELOAD;
		scr_playerstate_reload();
	}
	
	// Switch to shoot state
	if (shoot) {
		state = PLAYERSTATE.SHOOT;
		scr_playerstate_shoot();
	}
	#endregion
	audio_play_sound(snd_player_sprint,98,true)
}