/// @description boss health bar
if !in_boss_cutscene and in_boss_fight and !boss_dead{
	var _bar_width = view_wport - 500;
	var _bar_percent = max(0, _bar_width * (obj_boss.hp / obj_boss.max_hp));
	draw_set_color(c_black);
	draw_rectangle((view_wport - _bar_width)/2, 25, view_wport - (view_wport - _bar_width)/2, 40, false);
	draw_set_color(c_red);
	draw_rectangle((view_wport - _bar_width)/2, 25, view_wport - (view_wport - _bar_width)/2 - _bar_width + _bar_percent, 40, false);
	draw_set_color(-1);
}
if exit_level {
	draw_set_color(c_black);
	draw_set_alpha(end_level_timer/90);
	draw_rectangle(0, 0, view_wport, view_hport, false);
	draw_set_color(-1);
	draw_set_alpha(-1);
}