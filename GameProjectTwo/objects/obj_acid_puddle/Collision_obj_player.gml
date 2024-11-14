/// @description Insert description here
// You can write your code in this editor
if (obj_player.alarm[0] <= 0) {
	hit_player(1);
	obj_player.alarm[0] = obj_player.take_dmg_cooldown;
}