/// @description Insert description here
// You can write your code in this editor
shader_set(sh_desaturated);
if !obj_menu_controller.show_menu {
	#region reload gui (temp and should be replaced later)
		draw_text(25, window_get_height() - 50, string(current_magazine) + " / " + string(max_magazine[$ equipped_gun]));
	#endregion

	#region grenata gui
	for(var _i=0; _i < cur_grenades; _i++){
		draw_sprite(spr_grenade,0,20 +(50 * _i) ,50);
	}
	#endregion
}
shader_reset();