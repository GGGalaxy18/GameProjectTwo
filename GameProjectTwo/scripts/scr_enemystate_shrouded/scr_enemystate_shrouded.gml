function scr_enemystate_shrouded() {
	direction = point_direction(x, y, obj_player.x, obj_player.y);
	#region sprite management
	if sprite_index != spr_enemy_shrouded_temp {
		sprite_index = spr_enemy_shrouded_temp;
		mask_index = spr_enemy_temp;
	}
	
	if lengthdir_x(1, direction) >= 0 { image_xscale = abs(image_xscale) * -1; }
	else { image_xscale = abs(image_xscale); }
	#endregion
	
	#region movement
	mp_potential_step_object(obj_player.x, obj_player.y, 2, noone);
	#endregion
	
	#region switch states
	if point_distance(x, y - sprite_height/2, obj_player.x, obj_player.y - obj_player.sprite_height/2) < 250 {
		state = ENEMYSTATE.REVEALED;
		scr_enemystate_revealed()
	}
	#endregion
}