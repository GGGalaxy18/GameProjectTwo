/// @description Insert description here
// You can write your code in this editor
if fly_timer < total_fly_time {
	fly_timer++;
	y = get_arc_altitude(fly_timer/total_fly_time, init_y, 60, end_y);
	x = init_x + (end_x - init_x) * (fly_timer/total_fly_time);
	image_angle += 2;
} else {
	flare_timer++;
	
}