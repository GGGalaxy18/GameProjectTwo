// @description draw bullet tracers
draw_self();

#region bullets
if (draw_bullets) {
	var _bullet_timer_max = 10;
	drawn_bullets = [];
	for (var _i=0; _i<array_length(bullets); _i++) {
		draw_set_alpha((_bullet_timer_max - bullet_timer)/min(_bullet_timer_max, fire_rate[$ equipped_gun]));
		var _dir = point_direction(bullets[_i][0], bullets[_i][1], bullets[_i][2], bullets[_i][3]);
		var _len = point_distance(bullets[_i][0], bullets[_i][1], bullets[_i][2], bullets[_i][3]);
		var _len_fracx = lengthdir_x(_len/4, _dir);
		var _len_fracy = lengthdir_y(_len/4, _dir);
		var _x = bullets[_i][0];
		var _y = bullets[_i][1];
		
		var _offset_x = lengthdir_x(20, _dir);
		var _offset_y = lengthdir_y(20, _dir);
		
		// draw bullet trail
		draw_line_width(_x + _offset_x, _y + _offset_y, _x + _len_fracx, _y + _len_fracy, 1);
		draw_line_width(_x + _len_fracx, _y + _len_fracy, _x + _len_fracx * 2, _y + _len_fracy * 2, 2);
		draw_line_width(_x + _len_fracx * 2, _y + _len_fracy * 2, _x + _len_fracx * 3, _y + _len_fracy * 3, 3);
		draw_line_width(_x + _len_fracx * 3, _y + _len_fracy * 3, _x + _len_fracx * 4, _y + _len_fracy * 4, 4);
		
		draw_set_alpha(1);
		
		// save bullet info for lighting
		array_push(drawn_bullets, [_x + _len_fracx * 2, _y + _len_fracy * 2, (_len + 60) / sprite_get_width(spr_light_bullet), _dir]);
	}
	if bullet_timer > min(_bullet_timer_max, fire_rate[$ equipped_gun]) {
		bullet_timer = 0;
		draw_bullets = false;
		bullets = [];
	}
	bullet_timer++;
}
#endregion

#region player health
var _health_gui_timer = 30;
var _show_health = true;
if health == max_health {
	_health_gui_timer++;
	if _health_gui_timer > 30 _show_health = false;
} else _health_gui_timer = 0;
if _show_health {
	for (var _i = 0; _i < health  ; _i++) {
		if _i < health {
			draw_sprite_ext(spr_health_bar, 0, x - 80 + (20 * _i), y - 220, .75,.75,0,c_white,1);
		} else draw_sprite(spr_health_bar, 1, x - 80 + (20 * _i), y - 220);
	}
}
#endregion

#region TEMP SPRINT DISPLAY
draw_text(x, y - sprite_height, string(stamina) + " / " + string(max_stamina));
#endregion