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
		audio_play_sound(snd_player_hurt, 99, false);
		health -= _dmg;
		if health <= 0 {
			state = PLAYERSTATE.DEAD;
			scr_playerstate_dead();
		}
	}
}