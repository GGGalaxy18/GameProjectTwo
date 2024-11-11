/// @description variable declarations
base_depth = depth;
image_xscale = 2.5;
image_yscale = 2.5;

var _spawn_left_right = irandom(3);
switch _spawn_left_right {
	case 0:	// right
	x = camera_get_view_x(view_camera[0]) + view_wport + random_range(100, 800);
	break;
	
	case 1:	// left
	case 2:
	case 3:
	x = camera_get_view_x(view_camera[0]) - random_range(100, 300);
	break;
}
y = random_range(416, room_height);

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