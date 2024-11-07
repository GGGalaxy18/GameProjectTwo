/// @description draw title screen
draw_set_font(fnt_title)
var _title = "Imperfect Defect";
var _view_width = camera_get_view_width(view_camera[0])/2;
draw_text_transformed_color(_view_width - string_width(_title)/2, 100, _title, 1, 1, 0, c_white, c_white, c_white, c_white, 1);
draw_set_font(-1);