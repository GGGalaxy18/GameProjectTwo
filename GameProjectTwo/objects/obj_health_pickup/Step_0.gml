var _progress = spread_timer / 30;
spread_timer++;
if _progress < 1 {
	y = get_arc_altitude(_progress, init_y, 20, end_y);
	x = init_x + (end_x - init_x) * _progress;
}