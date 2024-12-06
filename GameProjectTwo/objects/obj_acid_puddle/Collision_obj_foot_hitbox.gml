/// @description hurt player
if instance_exists(other.instance_to_follow) {
	if other.instance_to_follow.object_index == obj_player {
		if (obj_player.alarm[0] <= 0) {
			hit_player(1);
			obj_player.alarm[0] = obj_player.take_dmg_cooldown;
			//audio_play_sound(snd_player_hit,99,false) will add later
		}
	}
}