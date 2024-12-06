/// @description variable declarations
base_depth = depth;
image_xscale = 2.5;
image_yscale = 2.5;

var _spawn_left_right = irandom(3);
if force_right_spawn { _spawn_left_right = 0; }
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
var _spr_index = sprite_index;
sprite_index = spr_foot_hitbox;
while place_meeting(x, y, obj_foot_hitbox) {
	y = random_range(416, room_height);
}
sprite_index = _spr_index;

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