function scr_playerstate_free() {
	#region Movement management
	if ((xdir != 0) or (ydir != 0)) {
		direction = point_direction(0, 0, xdir * hmove_speed, ydir * vmove_speed);	// Sets direction of player
		x += lengthdir_x(abs(xdir), direction) * hmove_speed;
		y += lengthdir_y(abs(ydir), direction) * vmove_speed;
		x = clamp(x, 16, room_width - 16);
		y = clamp(y, 416, room_height);
		
		if (sprint) {
			x += sprint_additive * xdir;
			y += sprint_additive * ydir;
			var _speed_increase_percent = sqrt(sqr(xdir*(hmove_speed + sprint_additive)) + sqr(ydir*(vmove_speed +  sprint_additive))) / hmove_speed;
			image_speed = _speed_increase_percent;
			// TODO: stamina consumption
		} else { image_speed = 1; }
	}
	#endregion
	// TODO: dodge/jump
	
	#region Idle sprite management (W sprites are flipped)
	if (xdir == 0) and (ydir == 0) {
		// set E sprite
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
		if (xdir < 0) {						// Facing West
			image_xscale = -1 * abs(image_xscale);	// Set sprite to face left
		} else if (xdir > 0) {				// Facing East
			image_xscale = 1 * abs(image_xscale);	// Set sprite to face right
		}
	}
	#endregion
	
	#region State switch
	// Switch to shoot state
	if (shoot) {
		state = PLAYERSTATE.SHOOT;
		scr_playerstate_shoot();
	}
	
	// Switch to reload state
	if (reload and current_magazine < max_magazine[$ equipped_gun]) {
		state = PLAYERSTATE.RELOAD;
		scr_playerstate_reload();
	}
	#endregion
}