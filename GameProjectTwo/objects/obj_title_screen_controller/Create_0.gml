/// @description set vars
selected_button = "start";
buttons = ["start", "options", "quit"];

start_button_txt = "Start Game";
options_button_txt = "Options";
quit_button_txt = "Quit Game";

button_boxes = {
	"start": [0, 0, 0, 0],
	"options": [0, 0, 0, 0],
	"quit": [0, 0, 0, 0]
}

start = function() {
	room_goto_next();
	audio_stop_all()
}
options = function() {
	show_debug_message("options pressed");
}
quit = function() {
	game_end(0);
}

