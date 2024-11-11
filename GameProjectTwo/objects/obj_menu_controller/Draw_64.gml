#region menu
if show_menu {
	draw_set_color(c_black);
	draw_set_alpha(.6);
	draw_rectangle(0, 0, view_wport, view_hport, false); 
	draw_set_alpha(1);
	
	draw_set_font(fnt_button);
	var _left_margin = 100;
	var _top_margin = 150;
	if show_options {
		
	} else if show_controls {
		var _y_offset = 150;
		var _y_increment = 70;
		
		draw_set_font(fnt_menu_title);
		draw_set_color(c_white);
		draw_text(view_wport/2 - string_width("Controls")/2, _top_margin, "Controls");
		draw_set_font(fnt_button);
		draw_set_color(c_gray);
		
		var _controls_txts = ["Movement: W A S D / Arrow Keys", "Sprint: Left Shift", "Shoot: Left Mouse Click", "Toggle Menu: Esc", "Choose Selection: Enter"];
		
		for (var _i=0; _i<array_length(_controls_txts); _i++) {
			draw_text_transformed(view_wport/2 - string_width(_controls_txts[_i])/2, _top_margin + _y_offset + _y_increment*_i, _controls_txts[_i], 1, 1, 0);
		}
		
		draw_set_color(c_white);
		draw_text_transformed(view_wport/2 - string_width("> Back")/2, _top_margin + _y_offset + _y_increment*array_length(_controls_txts), "> Back", 1, 1, 0);
		
		controls_button_boxes[$ "back"] = [view_wport/2 - string_width("> Back")/2,
										_top_margin + _y_offset + _y_increment*array_length(_controls_txts),
										view_wport/2 + string_width("> Back")/2,
										_top_margin + _y_offset + _y_increment*array_length(_controls_txts) + string_height("> Back")];
	} else {
		draw_set_color(c_white);

		var _unsel_col = c_gray;
		var _sel_col = c_white;

		var _resume_col = _unsel_col;
		var _options_col = _unsel_col;
		var _controls_col = _unsel_col;
		var _exit_col = _unsel_col;
		var _quit_col = _unsel_col;

		var _resume_txt = resume_button_txt;
		var _options_txt = options_button_txt;
		var _controls_txt = controls_button_txt;
		var _exit_txt = exit_level_button_txt;
		var _quit_txt = quit_button_txt;

		var _y_offset = 150;
		var _y_increment = 70;
		
		draw_set_font(fnt_menu_title);
		draw_text(view_wport/2 - string_width("Pause")/2, _top_margin, "Pause");
		draw_set_font(fnt_button);
		
		switch (menu_selection) {
			case "resume":
				_resume_col = _sel_col;
				_resume_txt = "> " + resume_button_txt;
			break;
	
			case "options":
				_options_col = _sel_col;
				_options_txt = "> " + options_button_txt;
			break;
	
			case "controls":
				_controls_col = _sel_col;
				_controls_txt = "> " + controls_button_txt;
			break;
			
			case "exit_level":
				_exit_col = _sel_col;
				_exit_txt = "> " + exit_level_button_txt;
			break;
			
			case "quit":
				_quit_col = _sel_col;
				_quit_txt = "> " + quit_button_txt;
			break;
		}
		
		draw_text_transformed_color(view_wport/2 - string_width(_resume_txt)/2, _top_margin + _y_offset, _resume_txt, 1, 1, 0, _resume_col, _resume_col, _resume_col, _resume_col, 1);
		draw_text_transformed_color(view_wport/2 - string_width(_options_txt)/2, _top_margin + _y_offset + _y_increment, _options_txt, 1, 1, 0, _options_col, _options_col, _options_col, _options_col, 1);
		draw_text_transformed_color(view_wport/2 - string_width(_controls_txt)/2, _top_margin + _y_offset + _y_increment*2, _controls_txt, 1, 1, 0, _controls_col, _controls_col, _controls_col, _controls_col, 1);
		draw_text_transformed_color(view_wport/2 - string_width(_exit_txt)/2, _top_margin + _y_offset + _y_increment*3, _exit_txt, 1, 1, 0, _exit_col, _exit_col, _exit_col, _exit_col, 1);
		draw_text_transformed_color(view_wport/2 - string_width(_quit_txt)/2, _top_margin + _y_offset + _y_increment*4, _quit_txt, 1, 1, 0, _quit_col, _quit_col, _quit_col, _quit_col, 1);

		menu_button_boxes[$ "resume"] = [view_wport/2 - string_width(_resume_txt)/2,
										_top_margin + _y_offset,
										view_wport/2 + string_width(_resume_txt)/2,
										_top_margin + _y_offset + string_height(_resume_txt)];
										
		menu_button_boxes[$ "options"] = [view_wport/2 - string_width(_options_txt)/2,
										_top_margin + _y_offset + _y_increment,
										view_wport/2 + string_width(_options_txt)/2,
										_top_margin + _y_offset + _y_increment + string_height(_options_txt)];
										
		menu_button_boxes[$ "controls"] = [view_wport/2 - string_width(_controls_txt)/2,
										_top_margin + _y_offset + _y_increment*2,
										view_wport/2 + string_width(_controls_txt)/2,
										_top_margin + _y_offset + _y_increment*2 + string_height(_controls_txt)];
										
		menu_button_boxes[$ "exit_level"] = [view_wport/2 - string_width(_exit_txt)/2,
										_top_margin + _y_offset + _y_increment*3,
										view_wport/2 + string_width(_exit_txt)/2,
										_top_margin + _y_offset + _y_increment*3 + string_height(_exit_txt)];
										
		menu_button_boxes[$ "quit"] = [view_wport/2 - string_width(_quit_txt)/2,
										_top_margin + _y_offset + _y_increment*4,
										view_wport/2 + string_width(_quit_txt)/2,
										_top_margin + _y_offset + _y_increment*4 + string_height(_quit_txt)];
										
	}
}
#region

#region controls
#endregion

#region gun select temp
#endregion

draw_set_color(c_white);
draw_set_font(-1);