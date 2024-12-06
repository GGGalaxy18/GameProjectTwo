/// @description gain grenades
if other.cur_grenades < other.max_grenades {
	other.cur_grenades++;
	instance_destroy();
}