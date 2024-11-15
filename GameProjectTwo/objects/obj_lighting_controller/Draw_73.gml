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

#region player spotlight
if (instance_exists(obj_player)) {
	var _light_sprite = spr_light_pix;
	with (obj_player) {
		var _scale = .9;
		draw_sprite_ext(_light_sprite, 0, x, y-sprite_height/2, _scale, _scale, 0, c_white, 1);
	}
}
#endregion

#region bullet light
if (instance_exists(obj_player)) {
	if (obj_player.draw_bullets) {
		var _bullet_arr = obj_player.drawn_bullets;
		for (var _i=0; _i<array_length(_bullet_arr); _i++) {
			draw_sprite_ext(spr_light_bullet, 0, _bullet_arr[_i][0], _bullet_arr[_i][1], _bullet_arr[_i][2], 2, _bullet_arr[_i][3], c_white, 1);
		}
	}
}
#endregion

#region flare light
with (obj_flare) {
	var _scale = .6;
	draw_sprite_ext(spr_light_pix, 0, x, y - 30, _scale, _scale, 0, c_white, 1);
}
#endregion

#region fire grenade light
with (obj_temp_explosion) {
	var _scale = 1.5;
	draw_sprite_ext(spr_light_pix, 0, x, y - 200, _scale, _scale, 0, c_white, 1);
}
#endregion

#region mouse light
if (room == rm_title_screen) {
	var _light_sprite = spr_light_pix;
	var _scale = .3;
	draw_sprite_ext(_light_sprite, 0, mouse_x, mouse_y, _scale, _scale, 0, c_white, 1);
}
#endregion

gpu_set_blendmode(bm_normal);

surface_reset_target();