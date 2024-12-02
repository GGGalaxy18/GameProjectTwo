/// @description proceed with dialog or destroy
//obj_player.in_dialog = true;
if (not showing_dialog) {
	if (count() <= 0) {
		//obj_player.in_dialog = false;
		instance_destroy();
		return;
	}
	
	current_dialog = pop();
	showing_dialog = true;
	can_proceed = false;
	alarm[0] = text_wait;
} else {
	if count() == 1 {
		if can_proceed and dialog_end {
			showing_dialog = false;
			alpha = 0;
		}
	} else {
		if (can_proceed and keyboard_check_released(key_next)) {
			showing_dialog = false;
			alpha = 0;
		}
	}
}