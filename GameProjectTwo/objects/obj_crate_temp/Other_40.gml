/// @description set to random position for title screen
if room == rm_title_screen {
	var _camx = camera_get_view_x(view_camera[0]);
	var _camwidth = camera_get_view_width(view_camera[0]);
	if x + sprite_width/2 < _camx {
		x = random_range(_camx + _camwidth, _camx + _camwidth * 2);
		y = random_range(416, camera_get_view_height(view_camera[0]));
	}
}