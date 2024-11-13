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
	
	#region sprint bar
	draw_sprite_ext(spr_stamina_bar,0,30,25,max(0,stamina/max_stamina),1,0,c_ltgray,1);
	#endregion
	
	#region health vignette
	draw_set_alpha(.5 - health/max_health*.5);
	draw_sprite(spr_health_vignette, 0, 0, 0);
	draw_set_alpha(1);
	#endregion
	
	shader_set(sh_desaturated);
	#region reload gui
	draw_set_font(fnt_cur_ammo)
	if (current_magazine < 10) {
		draw_text(35,650,string(current_magazine));
	} else {
		draw_text(20,650,string(current_magazine));
	}
	draw_text(60,670, "/")
	
	draw_set_font(fnt_max_ammo);
	
	draw_text(80,687, string(max_magazine[$ equipped_gun]));
	draw_set_font(-1);
#endregion

	#region grenata gui
draw_sprite(spr_grenade_icon,0,130,645)
draw_sprite(spr_grenade_icon,0,160,675)
draw_sprite(spr_grenade_icon,0,130,705)
#endregion
	shader_reset();
}


/*
To push to game


Player Draw Gui

/// @description Insert description here
// You can write your code in this editor







*/