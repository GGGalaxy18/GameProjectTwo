// @description draw bullet tracers
draw_self();

if (draw_bullets) {
	bullet_timer++;
	for (var _i=0; _i<array_length(bullets); _i++) {
		draw_line(bullets[_i][0], bullets[_i][1], bullets[_i][2], bullets[_i][3]);
	}
	if bullet_timer > 10 {
		bullet_timer = 0;
		draw_bullets = false;
		bullets = [];
	}
}


//Player health 
//shader_set(sh_shader);
draw_self();
//shader_reset();

var health_gui_timer = 30;
// health count
var _show_health = true;
if health = max_health {
	health_gui_timer++;
	if health_gui_timer > 30 _show_health = false;
} else health_gui_timer = 0;
if _show_health {
	show_debug_message(health)
	for (var i = 0; i < health  ; i++) {
		if i < health {
			draw_sprite_ext(spr_health_bar, 0, x - 80 + (20 * i), y - 220, .75,.75,0,c_white,1);
		} else draw_sprite(spr_health_bar, 1, x - 80 + (20 * i), y - 220);
	}
}
