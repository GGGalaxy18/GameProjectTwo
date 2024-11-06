/// @description Insert description here
// You can write your code in this editor

#region reload gui (temp and should be replaced later)
	draw_text(25, window_get_height() - 50, string(current_magazine) + " / " + string(max_magazine[$ equipped_gun]));
#endregion

#region grenata gui
for(var i=0; i < cur_grenades; i++){
	draw_sprite(spr_grenade,0,20 +(50 * i) ,50);
}
#endregion