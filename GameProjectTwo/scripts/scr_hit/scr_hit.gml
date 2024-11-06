function hit_enemy(_enemy) {
	with (_enemy) {
		// TODO: set direction based on player hit
		state = ENEMYSTATE.HIT;
		scr_enemystate_hit();
	}
}

function hit_player(_dmg) {
	with (obj_player) {
		health -= _dmg;
	}
}