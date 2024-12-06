/// @description fade to black
draw_set_color(c_black);
draw_set_alpha(end_level_timer/90);
draw_rectangle(0, 0, view_wport, view_hport, false);
draw_set_color(-1);
draw_set_alpha(-1);