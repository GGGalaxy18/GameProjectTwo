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

explode = function() {
	instance_create_layer(x,y,"Instances", obj_temp_explosion);
	instance_destroy();
}