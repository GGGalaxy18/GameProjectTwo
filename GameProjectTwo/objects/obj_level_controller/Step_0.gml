// Have camera follow player
if camera_get_view_x(view_camera[0]) <= current_breakpoint {
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + base_camera_scroll, camera_get_view_y(view_camera[0]));
}

obj_player.x = clamp(obj_player.x, camera_get_view_x(view_camera[0]) + 16, camera_get_view_x(view_camera[0]) + view_wport - 16);