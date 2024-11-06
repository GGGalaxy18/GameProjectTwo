draw_surface(application_surface, 0, 0);

draw_surface_stretched(light_surface, 0, 0, window_get_width(), window_get_height());

draw_surface_stretched(foreground_surface, 0, 0, window_get_width(), window_get_height());

with (obj_enemy) {
	if (state == ENEMYSTATE.SHROUDED) {
		camera_apply(view_get_camera(0));
		draw_self();
	} else {
		camera_apply(view_get_camera(0));
		draw_sprite_ext(spr_enemy_shrouded_temp, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
	}
}