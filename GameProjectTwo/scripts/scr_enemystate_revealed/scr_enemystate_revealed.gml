function scr_enemystate_revealed() {
	direction = point_direction(x, y, obj_player.x, obj_player.y);
	#region sprite management
	if sprite_index != spr_enemy_temp {
		sprite_index = spr_enemy_temp;
	}
	
	if lengthdir_x(1, direction) >= 0 { image_xscale = abs(image_xscale) * -1; }
	else { image_xscale = abs(image_xscale); }
	#endregion
	
	#region movement
	var _adjusted_speed = move_speed_revealed / 4 * cos(pi * direction/90) + 3 * move_speed_revealed / 4;
	mp_potential_step_object(obj_player.x, obj_player.y, _adjusted_speed, noone);
	#endregion
	
	#region switch states
	if point_distance(x, y - sprite_height/2, obj_player.x, obj_player.y - obj_player.sprite_height/2) >= light_radius {
		state = ENEMYSTATE.SHROUDED;
		scr_enemystate_shrouded();
	}
	#endregion
}