/// @description button hover functionality
var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

if show_options {
		
} else if show_controls {
	if keyboard_check_released(vk_enter) {
		back("controls");
	}
} else {
	#region keyboard navigation
	if keyboard_check_released(vk_up) or keyboard_check_released(ord("W")) {
		var _index = array_find_index(buttons, function(_e, _i) { return _e == menu_selection; });

		_index--;
		if _index < 0 {
			_index = array_length(buttons) - 1;
		}

		menu_selection = buttons[_index];
	}
	if keyboard_check_released(vk_down) or keyboard_check_released(ord("S")) {
		var _index = array_find_index(buttons, function(_e, _i) { return _e == menu_selection; });

		_index++;
		if _index >= array_length(buttons) {
			_index = 0;
		}

		menu_selection = buttons[_index];
	}
	if keyboard_check_released(vk_enter) {
		switch (menu_selection) {
			case "resume":
				resume();
			break;
	
			case "options":
				options();
			break;
	
			case "controls":
				controls();
			break;
	
			case "exit_level":
				exit_level();
			break;
	
			case "quit":
				quit();
			break;
		}
	}
	#endregion
	
	#region button hover
	// In start button
	if (menu_button_boxes[$ "resume"][0] < _mouse_x and _mouse_x < menu_button_boxes[$ "resume"][2]) {
		if (menu_button_boxes[$ "resume"][1] < _mouse_y and _mouse_y < menu_button_boxes[$ "resume"][3]) {
			menu_selection = "resume";
		}
	}

	// In options button
	if (menu_button_boxes[$ "options"][0] < _mouse_x and _mouse_x < menu_button_boxes[$ "options"][2]) {
		if (menu_button_boxes[$ "options"][1] < _mouse_y and _mouse_y < menu_button_boxes[$ "options"][3]) {
			menu_selection = "options";
		}
	}

	// In controls button
	if (menu_button_boxes[$ "controls"][0] < _mouse_x and _mouse_x < menu_button_boxes[$ "controls"][2]) {
		if (menu_button_boxes[$ "controls"][1] < _mouse_y and _mouse_y < menu_button_boxes[$ "controls"][3]) {
			menu_selection = "controls";
		}
	}

	// In exit_level button
	if (menu_button_boxes[$ "exit_level"][0] < _mouse_x and _mouse_x < menu_button_boxes[$ "exit_level"][2]) {
		if (menu_button_boxes[$ "exit_level"][1] < _mouse_y and _mouse_y < menu_button_boxes[$ "exit_level"][3]) {
			menu_selection = "exit_level";
		}
	}

	// In quit button
	if (menu_button_boxes[$ "quit"][0] < _mouse_x and _mouse_x < menu_button_boxes[$ "quit"][2]) {
		if (menu_button_boxes[$ "quit"][1] < _mouse_y and _mouse_y < menu_button_boxes[$ "quit"][3]) {
			menu_selection = "quit";
		}
	}
	#endregion
}