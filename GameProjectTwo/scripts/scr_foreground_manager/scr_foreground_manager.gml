function layer_render_start() {
	if (event_type == ev_draw) {
		if (event_number == ev_draw_normal) {
			surface_set_target(obj_lighting_controller.foreground_surface);
			draw_clear_alpha(c_white, 0);
		}
	}
}

function layer_render_end() {
	if (event_type == ev_draw) {
		if (event_number == ev_draw_normal) {
			surface_reset_target();
		}
	}
}