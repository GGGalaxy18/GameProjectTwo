function change_gun(_gun) {
	obj_player.equipped_gun = _gun;
	obj_player.current_magazine = obj_player.max_magazine[$ obj_player.equipped_gun];
}