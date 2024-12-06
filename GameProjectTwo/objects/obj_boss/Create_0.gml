/// @description Insert description here
// You can write your code in this editor
base_depth = depth;
image_xscale = .3;
image_yscale = .3;

in_cutscene = true;

state = BOSSSTATE.CUTSCENE;

// foot hitbox
hitbox_struct = {
	instance_to_follow: id,
	y_offset: 0
}
instance_create_layer(x, y, "Instances", obj_foot_hitbox, hitbox_struct);