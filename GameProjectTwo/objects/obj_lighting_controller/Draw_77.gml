shader_set(sh_desaturated);
draw_surface(application_surface, 0, 0);

draw_surface_stretched(light_surface, 0, 0, window_get_width(), window_get_height());

draw_surface_stretched(foreground_surface, 0, 0, window_get_width(), window_get_height());

with (obj_enemy) {
	if (sprite_index == spr_enemy_shrouded_temp or sprite_index == spr_flying_enemy_shrouded_temp) {
		camera_apply(view_get_camera(0));
		draw_self();
	} else {
		camera_apply(view_get_camera(0));
		if object_index == obj_enemy {
			draw_sprite_ext(spr_enemy_shrouded_temp, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
		} else if object_index == obj_flying_enemy {
			draw_sprite_ext(spr_flying_enemy_shrouded_temp, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
		}
	}
}

shader_reset();