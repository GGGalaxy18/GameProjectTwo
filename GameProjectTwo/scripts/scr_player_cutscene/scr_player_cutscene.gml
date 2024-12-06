function set_player_cutscene() {
	obj_player.in_cutscene = true;
	obj_player.sprite_index = spr_player;
}

function set_player_out_cutscene() {
	obj_player.in_cutscene = false;
}