function scr_enemystate_revealed() {
	if sprite_index != spr_enemy_temp {
		sprite_index = spr_enemy_temp;
	}
	
	if point_distance(x, y - sprite_height/2, obj_player.x, obj_player.y - obj_player.sprite_height/2) > 250 {
		state = ENEMYSTATE.SHROUDED;
		scr_enemystate_shrouded();
	}
}