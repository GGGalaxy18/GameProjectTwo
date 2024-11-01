function scr_playerstate_free() {
	// Movement management
	if ((xdir != 0) or (ydir != 0)) {
		direction = point_direction(0, 0, xdir * hmove_speed, ydir * vmove_speed);	// Sets direction of player
		x += xdir * hmove_speed;
		y += ydir * vmove_speed;
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
	
	// TODO: dodge/jump
	
	// Idle sprite management (W sprites are flipped)
	if (xdir == 0) and (ydir == 0) {
		if (xdir < 0) {						// Facing _____ West
			image_xscale = -1 * abs(image_xscale);	// Set sprite to face left
			if (ydir < 0) {					// Facing North West
				// set NE sprite
			} else if (ydir > 0) {			// Facing South West
				// set SW sprite
			} else {						// Facing West
				// set E sprite
			}
		} else if (xdir > 0) {				// Facing _____ East
			image_xscale = 1 * abs(image_xscale);	// Set sprite to face right
			if (ydir < 0) {					// Facing North East
				// set NE sprite
			} else if (ydir > 0) {			// Facing South East
				// set SE sprite
			} else {						// Facing East
				// set E sprite
			}
		} else {							// Facing North, South, or nowhere
			if (ydir < 0) {					// Facing North
				// set N sprite
			} else if (ydir > 0) {			// Facing South
				// set S sprite
			} else {						// Facing nowhere (shouldn't be reached)
				// set idle sprite
			}
		}
	} else {	// Walking sprite management (W sprites are flipped)
		if (xdir < 0) {						// Facing _____ West
			image_xscale = -1 * abs(image_xscale);	// Set sprite to face left
			if (ydir < 0) {					// Facing North West
				// set NE sprite
			} else if (ydir > 0) {			// Facing South West
				// set SE sprite
			} else {						// Facing West
				// set E sprite
			}
		} else if (xdir > 0) {				// Facing _____ East
			image_xscale = 1 * abs(image_xscale);	// Set sprite to face right
			if (ydir < 0) {					// Facing North East
				// set NE sprite
			} else if (ydir > 0) {			// Facing South East
				// set SE sprite
			} else {						// Facing East
				// set E sprite
			}
		} else {							// Facing North, South, or nowhere
			if (ydir < 0) {					// Facing North
				// set N sprite
			} else if (ydir > 0) {			// Facing South
				// set S sprite
			}
		}
	}
	
	// Switch to shoot state
	if (shoot) {
		state = PLAYERSTATE.SHOOT;
		scr_playerstate_shoot();
	}
}