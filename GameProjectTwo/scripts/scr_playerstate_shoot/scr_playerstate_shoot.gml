function scr_playerstate_shoot() {
	#region Movement management (has TODO)
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
	#region Shooting sprite management (W sprites are flipped)
	var _dir = point_direction(x, y, mouse_x, mouse_y);
	if lengthdir_x(1, _dir) < 0{
		image_xscale = abs(image_xscale) * -1;
	} else { image_xscale = abs(image_xscale); }
	#endregion
	
	#region shooting
	if not player_shot and current_magazine > 0 {
		if equipped_gun == "pistol" {
			var _x_adjust = 45 * image_xscale;
			var _y_adjust = -sprite_height/2 - 18;
			var _range_increment = 0;
			var _x = x + _x_adjust;
			var _y = y + _y_adjust;
			var _bullet_direction = point_direction(_x, _y, mouse_x, mouse_y);
		
			while (_range_increment < bullet_range.pistol) {
				var _target = collision_line(_x, _y, _x + lengthdir_x(_range_increment, _bullet_direction), _y + lengthdir_y(_range_increment, _bullet_direction), obj_enemy, true, true);
				if _target {
					hit_enemy(_target);
					draw_bullets = true;
					bullets = [[_x, _y, _x + lengthdir_x(_range_increment, _bullet_direction), _y + lengthdir_y(_range_increment, _bullet_direction)]];
					break;
				} else { _range_increment += 10; }
			}
			draw_bullets = true;
			bullets = [[_x, _y, _x + lengthdir_x(_range_increment, _bullet_direction), _y + lengthdir_y(_range_increment, _bullet_direction)]];
			player_shot = true;
		}
		if equipped_gun == "shotgun" {
			var _y = y - sprite_height/2
			var _bullet_spread = 30;
			var _bullet_per_shell = 8;
			var _bullet_direction = point_direction(x, _y, mouse_x, mouse_y) + _bullet_spread/2;
			
			for (var _i=0; _i<_bullet_per_shell; _i++) {
				var _range_increment = 0;
				var _x2;
				var _y2;
				while (_range_increment < bullet_range.shotgun) {
					_x2 = x + lengthdir_x(_range_increment, _bullet_direction - (_bullet_spread/_bullet_per_shell * _i));
					_y2 = _y + lengthdir_y(_range_increment, _bullet_direction - (_bullet_spread/_bullet_per_shell * _i));
					var _target = collision_line(x, _y, _x2, _y2, obj_enemy, true, true);
					if _target {
						hit_enemy(_target);
						draw_bullets = true;
						array_push(bullets, [x, _y, _x2, _y2]);
						break;
					} else { _range_increment += 10; }
				}
				draw_bullets = true;
				array_push(bullets, [x, _y, _x2, _y2]);
			}
			player_shot = true;
		}
		if equipped_gun == "smg" {
			var _range_increment = 0;
			var _y = y - sprite_height/2
			var _bullet_direction = point_direction(x, _y, mouse_x, mouse_y);
		
			while (_range_increment < bullet_range.smg) {
				var _target = collision_line(x, _y, x + lengthdir_x(_range_increment, _bullet_direction), _y + lengthdir_y(_range_increment, _bullet_direction), obj_enemy, true, true);
				if _target {
					hit_enemy(_target);
					draw_bullets = true;
					bullets = [[x, _y, x + lengthdir_x(_range_increment, _bullet_direction), _y + lengthdir_y(_range_increment, _bullet_direction)]];
					break;
				} else { _range_increment += 10; }
			}
			draw_bullets = true;
			bullets = [[x, _y, x + lengthdir_x(_range_increment, _bullet_direction), _y + lengthdir_y(_range_increment, _bullet_direction)]];
			player_shot = true;
		}
		if equipped_gun == "rifle" {
			var _range_increment = 0;
			var _y = y - sprite_height/2
			var _bullet_direction = point_direction(x, _y, mouse_x, mouse_y);
		
			while (_range_increment < bullet_range.rifle) {
				var _target = collision_line(x, _y, x + lengthdir_x(_range_increment, _bullet_direction), _y + lengthdir_y(_range_increment, _bullet_direction), obj_enemy, true, true);
				if _target {
					hit_enemy(_target);
					draw_bullets = true;
					bullets = [[x, _y, x + lengthdir_x(_range_increment, _bullet_direction), _y + lengthdir_y(_range_increment, _bullet_direction)]];
					break;
				} else { _range_increment += 10; }
			}
			draw_bullets = true;
			bullets = [[x, _y, x + lengthdir_x(_range_increment, _bullet_direction), _y + lengthdir_y(_range_increment, _bullet_direction)]];
			player_shot = true;
		}
		if equipped_gun == "sniper" {
			var _range_increment = 0;
			var _y = y - sprite_height/2
			var _bullet_direction = point_direction(x, _y, mouse_x, mouse_y);
			var _hit_enemies = [];
		
			while (_range_increment < bullet_range.sniper) {
				var _target = collision_line(x, _y, x + lengthdir_x(_range_increment, _bullet_direction), _y + lengthdir_y(_range_increment, _bullet_direction), obj_enemy, true, true);
				if _target and not array_contains(_hit_enemies, _target) {
					hit_enemy(_target);
					array_push(_hit_enemies, _target);
				} else { _range_increment += 10; }
			}
			draw_bullets = true;
			bullets = [[x, _y, x + lengthdir_x(_range_increment, _bullet_direction), _y + lengthdir_y(_range_increment, _bullet_direction)]];
			player_shot = true;
		}
		current_magazine--;
	} 
	#endregion
	
	shoot_timer++;
	
	#region State switch
	// Go to free state
	if shoot_timer > fire_rate[$ equipped_gun] {
		player_shot = false;
		state = PLAYERSTATE.FREE;
		shoot_timer = 0;
		scr_playerstate_free();
	}
	#endregion
}