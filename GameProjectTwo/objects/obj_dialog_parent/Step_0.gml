/// @description proceed with dialog or destroy
key_next = keyboard_check_released(vk_space);

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
	if count() == 0 {
		if room == rm_tutorial {
			if can_proceed and key_next and obj_tutorial_level_controller.checkpoint_completed[checkpoint_index] {
				showing_dialog = false;
				alpha = 0;
			}
		} else {
			if can_proceed and key_next {
				showing_dialog = false;
				alpha = 0;
			}
		}
	} else {
		if can_proceed and key_next {
			showing_dialog = false;
			alpha = 0;
		}
	}
}