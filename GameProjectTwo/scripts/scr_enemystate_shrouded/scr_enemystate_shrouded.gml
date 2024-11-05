function scr_enemystate_shrouded() {
	if sprite_index != spr_enemy_shrouded_temp {
		sprite_index = spr_enemy_shrouded_temp;
		mask_index = spr_enemy_temp;
	}
	
	if point_distance(x, y - sprite_height/2, obj_player.x, obj_player.y - obj_player.sprite_height/2) < 250 {
		state = ENEMYSTATE.REVEALED;
		scr_enemystate_revealed()
	}
}