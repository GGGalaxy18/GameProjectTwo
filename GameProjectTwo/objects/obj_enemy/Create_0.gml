/// @description variable declarations
base_depth = depth;
image_xscale = 2.5;
image_yscale = 2.5;

state = ENEMYSTATE.SHROUDED;

// foot hitbox
hitbox_struct = {
	instance_to_follow: id,
	y_offset: 0
}
instance_create_layer(x, y, "Instances", obj_foot_hitbox, hitbox_struct);

// hit state vars
hit_timer = 0;

// attack state vars
attack_timer = 0;
attack_cooldown = 60;