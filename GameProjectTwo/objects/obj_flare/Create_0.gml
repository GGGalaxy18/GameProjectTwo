/// @description Insert description here
// You can write your code in this editor

fly_timer = 0;
total_fly_time = 45;

flare_timer = 0;
total_flare_time = 240

base_depth = depth;

init_y = y;
init_x = x;
end_y = max(416, mouse_y);
end_x = mouse_x;

if obj_player.in_cutscene {
	end_y = cutscene_y;
	end_x = cutscene_x;
	show_debug_message("flare created")
}