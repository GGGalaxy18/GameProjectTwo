/// @description Insert description here
// You can write your code in this editor
if mouse_check_button_released(mb_left) {
	if view_wport/2 - 30 < mouse_x and mouse_x < view_wport/2 + 30 {
		if 400 < mouse_y and mouse_y < 400 + 40 {
			room_goto(rm_hub);
		}
	}
	
	
	if view_wport/2 - 25 < mouse_x and mouse_x < view_wport/2 + 25 {
		if 480 < mouse_y and mouse_y < 480 + 40 {
			game_end(0);
		}
	}
}