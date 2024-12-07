/// @description Insert description here
// You can write your code in this editor

#region camera movement
var _cam_movement_offset = 500;
var _max_scroll = 1000;
if obj_player.x > camera_get_view_x(view_camera[0]) + view_wport - _cam_movement_offset and camera_get_view_x(view_camera[0]) < _max_scroll {
	cam_scroll = min(4, obj_player.x - (camera_get_view_x(view_camera[0]) + view_wport - _cam_movement_offset));
	camera_set_view_pos(view_camera[0], min(camera_get_view_x(view_camera[0]) + cam_scroll, _max_scroll), camera_get_view_y(view_camera[0]));
	is_scrolling = true;
} else if obj_player.x < camera_get_view_x(view_camera[0]) + _cam_movement_offset and camera_get_view_x(view_camera[0]) > 0 {
	cam_scroll = min(4, (camera_get_view_x(view_camera[0]) + _cam_movement_offset) - obj_player.x);
	camera_set_view_pos(view_camera[0], max(camera_get_view_x(view_camera[0]) - cam_scroll, 0), camera_get_view_y(view_camera[0]));
	is_scrolling = true;
} else { is_scrolling = false; cam_scroll = 0; }

obj_player.x = clamp(obj_player.x, camera_get_view_x(view_camera[0]) + 16, camera_get_view_x(view_camera[0]) + view_wport - 16);
#endregion