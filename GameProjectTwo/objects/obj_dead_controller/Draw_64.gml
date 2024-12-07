/// @description 
draw_set_color(c_red);
draw_set_font(fnt_title);
draw_text((view_wport - 300)/2, 300, "YOU DIED :(");
draw_set_color(c_white);
draw_set_font(fnt_button);
draw_text((view_wport - 60)/2, 400, "retry?");
draw_text((view_wport - 50)/2, 480, "quit?");