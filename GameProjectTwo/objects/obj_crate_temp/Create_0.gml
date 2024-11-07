hitbox_struct = {
	instance_to_follow: id,
	y_offset: 0
}
instance_create_layer(x, y, "Instances", obj_foot_hitbox, hitbox_struct);

base_depth = depth;