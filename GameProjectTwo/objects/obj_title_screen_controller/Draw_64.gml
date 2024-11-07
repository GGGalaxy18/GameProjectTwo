/// @description draw title screen
#region title
draw_set_font(fnt_title);
var _title = "Imperfect Defect";
var _view_width = camera_get_view_width(view_camera[0]);
var _view_height = camera_get_view_height(view_camera[0]);
var _left_margin = 50;
draw_text_transformed_color(_left_margin, 100, _title, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
draw_set_font(-1);
#endregion

#region buttons
draw_set_font(fnt_button);

var _unsel_col = c_gray;
var _sel_col = c_white;

var _start_col = _unsel_col;
var _options_col = _unsel_col;
var _quit_col = _unsel_col;

var _start_txt = start_button_txt;
var _options_txt = options_button_txt;
var _quit_txt = quit_button_txt;

var _y_offest = 150;
var _y_increment = 100;

switch (selected_button) {
	case "start":
		_start_col = _sel_col;
		_start_txt = "> " + start_button_txt;
	break;
	
	case "options":
		_options_col = _sel_col;
		_options_txt = "> " + options_button_txt;
	break;
	
	case "quit":
		_quit_col = _sel_col;
		_quit_txt = "> " + quit_button_txt;
	break;
}

draw_text_transformed_color(_left_margin, _view_height - _y_offest - _y_increment*2, _start_txt, 1, 1, 0, _start_col, _start_col, _start_col, _start_col, 1);
draw_text_transformed_color(_left_margin, _view_height - _y_offest - _y_increment, _options_txt, 1, 1, 0, _options_col, _options_col, _options_col, _options_col, 1);
draw_text_transformed_color(_left_margin, _view_height - _y_offest, _quit_txt, 1, 1, 0, _quit_col, _quit_col, _quit_col, _quit_col, 1);

button_boxes[$ "start"] = [_left_margin, _view_height - _y_offest - _y_increment*2, _left_margin + string_width(_start_txt), _view_height - _y_offest - _y_increment*2 + string_height(_start_txt)];
button_boxes[$ "options"] = [_left_margin, _view_height - _y_offest - _y_increment, _left_margin + string_width(_options_txt), _view_height - _y_offest - _y_increment + string_height(_options_txt)];
button_boxes[$ "quit"] = [_left_margin, _view_height - _y_offest, _left_margin + string_width(_quit_txt), _view_height - _y_offest + string_height(_quit_txt)];
draw_set_color(-1);
draw_set_font(-1);
#endregion