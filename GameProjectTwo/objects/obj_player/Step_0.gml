/// @description movement and dash implementation
// Input definitions
left = keyboard_check(vk_left) or keyboard_check(ord("A"));
right = keyboard_check(vk_right) or keyboard_check(ord("D"));
up = keyboard_check(vk_up) or keyboard_check(ord("W"));
down = keyboard_check(vk_down) or keyboard_check(ord("S"));
//dash = keyboard_check_pressed(vk_space);
//melee_attack = mouse_check_button_pressed(mb_left);
//ranged_attack = mouse_check_button_pressed(mb_right);
//reload = keyboard_check_pressed(ord("R"));

// Ensures movement in 8 directions at a set speed (diagonal is faster)
xdir = right - left;
ydir = down - up;

/*
// State Machine
switch (state) {
	case PLAYERSTATE.FREE: scr_player_state_free(); break;
	case PLAYERSTATE.ATTACK_SLASH: scr_player_state_attack_slash(); break;
	case PLAYERSTATE.ATTACK_SHOOT: scr_player_state_attack_shoot(); break;
	case PLAYERSTATE.ATTACK_DASH: scr_player_state_attack_dash(); break;
	case PLAYERSTATE.DASH: scr_player_state_dash(); break;
	case PLAYERSTATE.DEAD: scr_player_state_dead(); break;
	case PLAYERSTATE.HIT: scr_player_state_hit(); break;
	case PLAYERSTATE.RELOAD: scr_player_state_reload(); break;
}
*/

// Movement management
if ((xdir != 0) or (ydir != 0)) {
	direction = point_direction(0, 0, xdir * hmove_speed, ydir * vmove_speed);	// Sets direction of player
	x += xdir * hmove_speed;
	y += ydir * vmove_speed;
	x = clamp(x, 16, room_width - 16);
	y = clamp(y, 480, room_height);
}
	
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

// Depth Management
depth = -1;