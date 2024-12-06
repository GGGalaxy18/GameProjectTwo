/// @description display message on screen

if (showing_dialog) {
	var _text_x = 30;
	var _text_y = 98;
	var _height = 32;
	var _border = 5;
	var _padding = 12;
	var _margin = 80;
	
	_height = string_height(current_dialog.message);
	
	if (sprite_get_height(current_dialog.sprite) > _height) {
		_height = sprite_get_height(current_dialog.sprite);
	}
	
	_height += _padding * 2;
	_text_x = sprite_get_width(current_dialog.sprite) + (_padding * 2) + _margin + (_border * 2);
	_text_y = _margin + _padding + (_border * 2);
	
	draw_set_alpha(alpha);
	
	draw_set_color(c_black);
	draw_rectangle(_margin, _margin, display_get_gui_width() - _margin, _height + _margin + (_border*4), false);
	
	draw_set_color(c_white);
	draw_rectangle(_margin + _border, _margin + _border, display_get_gui_width() - _border - _margin, _height + _margin + (_border*3), false);
	
	draw_set_color(c_black);
	draw_rectangle(_margin + (_border*2), _margin + (_border*2), display_get_gui_width() - (_border*2) - _margin, _height + _margin + (_border*2), false);
	
	if (current_dialog.sprite != -1) {
		draw_sprite(current_dialog.sprite, 0, _padding + _margin + _border * 2, _padding + _margin + _border * 2);
	}
	
	draw_set_color(c_white);
	if special_final_frame and count() == 0 draw_set_color(c_aqua);
	draw_text_ext(_text_x, _text_y, current_dialog.message, 16, display_get_gui_width() - 192);
	draw_set_color(c_white);
	
	if !cutscene_dialog {
		draw_text_ext(display_get_gui_width() - string_width("press SPACE to continue") - _margin - (_border * 1), _height + _margin + (_border * 4), "press SPACE to continue", 16, 256);
	}
	
	alpha = lerp(alpha, 1, 0.06);
	draw_set_alpha(1);
}