/// @description vars
show_menu = false;
show_options = false;
show_controls = false;
menu_selection = "resume"

buttons = ["resume", "options", "controls", "exit_level", "quit"];

resume_button_txt = "Resume";
options_button_txt = "Options";
controls_button_txt = "Controls";
exit_level_button_txt = "Exit to Map";
quit_button_txt = "Quit Game";

menu_button_boxes = {
	"resume": [0, 0, 0, 0],
	"options": [0, 0, 0, 0],
	"controls": [0, 0, 0, 0],
	"exit_level": [0, 0, 0, 0],
	"quit": [0, 0, 0, 0]
}

resume = function() {
	show_menu = false;
}
options = function() {
	//show_options = true;
	show_debug_message("options pressed");
}
controls = function() {
	show_controls = true;
}
exit_level = function() {
	room_goto(0);
}
quit = function() {
	game_end(0);
}

controls_button_boxes = {
	"back": [0, 0, 0, 0]
}

back = function(_toggle_menu) {
	if _toggle_menu == "options" {
		show_options = false;
	} else if _toggle_menu == "controls" {
		show_controls = false;
	}
}