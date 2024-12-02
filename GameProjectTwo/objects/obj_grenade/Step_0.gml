/// @description Insert description here
// You can write your code in this editor
grenade_timer++;
y = get_arc_altitude(grenade_timer/total_grenade_time, init_y, 60, end_y);
x = init_x + (end_x - init_x) * (grenade_timer/total_grenade_time);

if grenade_timer >= total_grenade_time explode(x, y);

image_angle -= 7;