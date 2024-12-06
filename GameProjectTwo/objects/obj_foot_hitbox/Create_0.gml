x = instance_to_follow.x;
y = instance_to_follow.y;

// player vars
if instance_to_follow.object_index == obj_player {
	image_xscale = 1.5;
	image_yscale = 1.5;
}

// flying enemy vars
if instance_to_follow.object_index == obj_flying_enemy {
	num_points = 7;
	flight_speed = 3;
	fly_path = path_add();
	for (var _i=1; _i<=num_points; _i++) {
		path_add_point(fly_path, camera_get_view_x(view_camera[0]) + view_wport/(num_points+1)*_i, random_range(60, 356), 100);
	}
	path_add_point(fly_path, camera_get_view_x(view_camera[0]) + view_wport/(num_points+1)*(num_points+.5), random_range(60, 356), 100);
	for (var _i=num_points; _i>0; _i--) {
		path_add_point(fly_path, camera_get_view_x(view_camera[0]) + view_wport/(num_points+1)*_i, random_range(60, 356), 100);
	}
	path_add_point(fly_path, camera_get_view_x(view_camera[0]) + view_wport/(num_points+1)*(.5), random_range(60, 356), 100);
	path_set_closed(fly_path, true);
	//path_set_kind(fly_path, true);
	
	get_to_path = true;
	path_point_index = 0;
}

// boss vars
fly_timer = 0;
total_fly_time = 60;

init_y = y;
init_x = x;
end_y = random_range(416, view_hport);
end_x = x - random_range(50, 200);