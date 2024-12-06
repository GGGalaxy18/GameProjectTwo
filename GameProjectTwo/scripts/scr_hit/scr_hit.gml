function hit_enemy(_enemy, _dmg) {
	with (_enemy) {
		// TODO: set direction based on player hit
		hp -= _dmg;
		if !(object_index == obj_boss) {
			if hp > 0 {
				state = ENEMYSTATE.HIT;
				scr_enemystate_hit();
			} else {
				state = ENEMYSTATE.DEAD;
				scr_enemystate_dead();
			}
		}
	}
}

function hit_player(_dmg) {
	with (obj_player) {
		health -= _dmg;
	}
}