function add_instances(_object) {
	var _instances = [];
	if instance_exists(_object) {
		for(var _i = 0; _i < instance_number(_object); _i++) {
			array_push(_instances, instance_find(_object, _i));
		}
	}
	return _instances;
}

var _depth_objects = [];
_depth_objects = array_concat(_depth_objects, add_instances(obj_enemy));
_depth_objects = array_concat(_depth_objects, add_instances(obj_health_pickup));
_depth_objects = array_concat(_depth_objects, add_instances(obj_player));
_depth_objects = array_concat(_depth_objects, add_instances(obj_crate_temp));
_depth_objects = array_concat(_depth_objects, add_instances(obj_flare));
_depth_objects = array_concat(_depth_objects, add_instances(obj_acid_puddle)); 
_depth_objects = array_concat(_depth_objects, add_instances(obj_boss));
_depth_objects = array_concat(_depth_objects, add_instances(obj_tent_inner));

array_sort(_depth_objects, function(_a, _b) { return _b.y - _a.y; });
for(var _i = 0; _i < array_length(_depth_objects); _i++) {
	_depth_objects[_i].depth = 101 + _i;
}