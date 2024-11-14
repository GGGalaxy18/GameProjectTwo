/// @description check for open status
if open {
	var _num_items = irandom_range(1, 3);
	for (var _i=0; _i<_num_items; _i++) {
		var _item_rng = irandom(5);
		switch _item_rng {
			case 0:
			case 1:
			case 2:
			case 3:
			instance_create_layer(x, y, "Instances", obj_grenade_pickup);
			break;
			
			case 4:
			case 5:
			instance_create_layer(x, y, "Instances", obj_health_pickup);
			break;
		}
	}
	instance_destroy();
}