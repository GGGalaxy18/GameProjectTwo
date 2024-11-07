/// @description state machine

direction_timer++;
if direction_timer > 60 {
	direction_timer = 0;
	direction = random(360);
}

// State Machine
if point_distance(x, y - sprite_height/2, mouse_x, mouse_y) >= light_radius {
	#region sprite management
	if sprite_index != spr_enemy_shrouded_temp {
		sprite_index = spr_enemy_shrouded_temp;
		mask_index = spr_enemy_temp;
	}
	
	if lengthdir_x(1, direction) >= 0 { image_xscale = abs(image_xscale) * -1; }
	else { image_xscale = abs(image_xscale); }
	#endregion
} else {
	#region sprite management
	if sprite_index != spr_enemy_temp {
		sprite_index = spr_enemy_temp;
	}
	
	if lengthdir_x(1, direction) >= 0 { image_xscale = abs(image_xscale) * -1; }
	else { image_xscale = abs(image_xscale); }
	#endregion
}

// Depth Management
depth = base_depth - 1;