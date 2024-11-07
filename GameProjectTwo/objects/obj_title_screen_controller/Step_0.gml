/// @description button hover functionality
var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

// In start button
if (button_boxes[$ "start"][0] < _mouse_x and _mouse_x < button_boxes[$ "start"][2]) {
	if (button_boxes[$ "start"][1] < _mouse_y and _mouse_y < button_boxes[$ "start"][3]) {
		selected_button = "start";
	}
}

// In options button
if (button_boxes[$ "options"][0] < _mouse_x and _mouse_x < button_boxes[$ "options"][2]) {
	if (button_boxes[$ "options"][1] < _mouse_y and _mouse_y < button_boxes[$ "options"][3]) {
		selected_button = "options";
	}
}

// In quit button
if (button_boxes[$ "quit"][0] < _mouse_x and _mouse_x < button_boxes[$ "quit"][2]) {
	if (button_boxes[$ "quit"][1] < _mouse_y and _mouse_y < button_boxes[$ "quit"][3]) {
		selected_button = "quit";
	}
}