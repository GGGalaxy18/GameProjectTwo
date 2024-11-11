/// @description click buttons
var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

if show_options {
		
} else if show_controls {
	if (controls_button_boxes[$ "back"][0] < _mouse_x and _mouse_x < controls_button_boxes[$ "back"][2]) {
		if (controls_button_boxes[$ "back"][1] < _mouse_y and _mouse_y < controls_button_boxes[$ "back"][3]) {
			back("controls");
		}
	}
} else {
	// In start button
	if (menu_button_boxes[$ "resume"][0] < _mouse_x and _mouse_x < menu_button_boxes[$ "resume"][2]) {
		if (menu_button_boxes[$ "resume"][1] < _mouse_y and _mouse_y < menu_button_boxes[$ "resume"][3]) {
			resume();
		}
	}

	// In options button
	if (menu_button_boxes[$ "options"][0] < _mouse_x and _mouse_x < menu_button_boxes[$ "options"][2]) {
		if (menu_button_boxes[$ "options"][1] < _mouse_y and _mouse_y < menu_button_boxes[$ "options"][3]) {
			options();
		}
	}

	// In controls button
	if (menu_button_boxes[$ "controls"][0] < _mouse_x and _mouse_x < menu_button_boxes[$ "controls"][2]) {
		if (menu_button_boxes[$ "controls"][1] < _mouse_y and _mouse_y < menu_button_boxes[$ "controls"][3]) {
			controls();
		}
	}

	// In exit_level button
	if (menu_button_boxes[$ "exit_level"][0] < _mouse_x and _mouse_x < menu_button_boxes[$ "exit_level"][2]) {
		if (menu_button_boxes[$ "exit_level"][1] < _mouse_y and _mouse_y < menu_button_boxes[$ "exit_level"][3]) {
			exit_level();
		}
	}

	// In quit button
	if (menu_button_boxes[$ "quit"][0] < _mouse_x and _mouse_x < menu_button_boxes[$ "quit"][2]) {
		if (menu_button_boxes[$ "quit"][1] < _mouse_y and _mouse_y < menu_button_boxes[$ "quit"][3]) {
			quit();
		}
	}
}