/// @description Insert description here
// You can write your code in this editor

//direction = 50;
//speed = 7;
//gravity = 0.05;
gravity_direction = 270;

grenade_timer = 0;
total_grenade_time = 45;

init_y = y;
init_x = x;
end_y = max(416, mouse_y);
end_x = mouse_x;

// set origin
sprite_set_offset(sprite_index, 37, 37);

explode = function(_new_x, _new_y) {
	instance_create_layer(_new_x, _new_y,"Instances", obj_temp_explosion);
	instance_destroy();
}