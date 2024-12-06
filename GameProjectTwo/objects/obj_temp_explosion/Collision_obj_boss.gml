/// @description 
if !hit_boss {
	hit_boss = true;
	other.is_vulnerable = true;
	other.alarm[0] = other.fire_vulnerable_time;
	hit_enemy(other, grenade_damage);
}