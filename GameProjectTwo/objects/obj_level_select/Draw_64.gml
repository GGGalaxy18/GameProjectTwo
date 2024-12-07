/// @description Insert description here
// You can write your code in this editor
if show_map {
	draw_set_font(fnt_button);
	draw_sprite(spr_map, 0, 0, 0);
	draw_text(view_wport - 50, 50, "X");
	draw_sprite(spr_map_marker, 0, 600, 300);
}