/// @description heal player
if health < other.max_health {
	health++;
	instance_destroy();
}