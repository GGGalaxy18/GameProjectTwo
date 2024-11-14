/// @description 
if !array_contains(hit_enemies, other.id) {
	hit_enemy(other.id, grenade_damage);
	array_push(hit_enemies, other.id);
}