/// @description Insert description here
// You can write your code in this editor
if !obj_menu_controller.show_menu {
	#region stamina vignette
	draw_set_alpha(.5 - stamina/max_stamina*.5);
	draw_set_color(c_black);
	draw_rectangle(0, 0, view_wport, view_hport, false);
	draw_set_alpha(1);
	draw_set_color(-1);
	#endregion
	
	shader_set(sh_desaturated);
	#region reload gui (temp and should be replaced later)
		draw_text(25, window_get_height() - 50, string(current_magazine) + " / " + string(max_magazine[$ equipped_gun]));
	#endregion

	#region grenata gui
	for(var _i=0; _i < cur_grenades; _i++){
		draw_sprite(spr_grenade,0,20 +(50 * _i) ,50);
	}
	#endregion
	shader_reset();
}