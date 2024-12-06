function scr_enemystate_dead() {
	audio_play_sound(snd_enemy_death_tp,80,false)
	#region sprite management
	#endregion
	
	#region death animation
	
	#endregion
	instance_destroy();
}