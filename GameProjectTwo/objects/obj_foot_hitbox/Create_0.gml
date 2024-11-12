x = instance_to_follow.x;
y = instance_to_follow.y;

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