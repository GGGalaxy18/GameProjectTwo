/// @description follow player
x = obj_player.x;
y = obj_player.y - obj_player.sprite_height/2;

if obj_player.image_xscale < 0 {
	image_xscale = -1;
} else { image_xscale = 1; }

depth = obj_player.depth - 1;