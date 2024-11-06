// Used to draw particles on top of surface
// part_system_drawit(global._part_system);

var _camera = view_get_camera(0);

if (!surface_exists(light_surface)) {
	var _camera_width = camera_get_view_width(_camera);
	var _camera_height = camera_get_view_height(_camera);
	
	light_surface = surface_create(_camera_width, _camera_height);
}
if (!surface_exists(foreground_surface)) {
	var _camera_width = camera_get_view_width(_camera);
	var _camera_height = camera_get_view_height(_camera);
	
	foreground_surface = surface_create(_camera_width, _camera_height);
}

surface_set_target(light_surface);
draw_clear_alpha(c_black, .9);
camera_apply(_camera);

gpu_set_blendmode(bm_subtract);

var _light_sprite = spr_light;
with (obj_player) {
	var _scale = 1.25;
	draw_sprite_ext(_light_sprite, 0, x, y-sprite_height/2, _scale, _scale, 0, c_white, 1);
}

gpu_set_blendmode(bm_normal);

surface_reset_target();