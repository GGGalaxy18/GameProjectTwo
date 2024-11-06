function scr_playerstate_reload() {
	var _reload_time = reload_speed[$ equipped_gun];
	#region Movement management
	if ((xdir != 0) or (ydir != 0)) {
		direction = point_direction(0, 0, xdir * hmove_speed, ydir * vmove_speed);	// Sets direction of player
		x += lengthdir_x(abs(xdir), direction) * hmove_speed;
		y += lengthdir_y(abs(ydir), direction) * vmove_speed;
		x = clamp(x, 16, room_width - 16);
		y = clamp(y, 416, room_height);
	}
	#endregion
	
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
	
	reload_timer++;
	#region State switch
	// Switch to shoot state
	if (reload_timer >= _reload_time) {
		// perform reload stuff
		current_magazine = max_magazine[$ equipped_gun];
		
		reload_timer = 0;
		state = PLAYERSTATE.FREE;
		scr_playerstate_free();
	}
	#endregion
}