/// @description Insert description here
// You can write your code in this editor
init_y = y;
init_x = x;
end_y = max(416, obj_player.y);
end_x = obj_player.x;

fly_timer = 0;
total_fly_time = 30*point_distance(init_x, init_y, end_x, end_y)/400;