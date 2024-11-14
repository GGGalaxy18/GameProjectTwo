/// @description state machine and inputs
// Input definitions
left = keyboard_check(vk_left) or keyboard_check(ord("A"));
right = keyboard_check(vk_right) or keyboard_check(ord("D"));
up = keyboard_check(vk_up) or keyboard_check(ord("W"));
down = keyboard_check(vk_down) or keyboard_check(ord("S"));
sprint = keyboard_check(vk_shift);
//dash = keyboard_check_pressed(vk_space);
shoot = mouse_check_button(mb_left);
grenade = mouse_check_button_pressed(mb_right) or keyboard_check_pressed(ord("G"));
flare = keyboard_check_pressed(ord("F"));
reload = keyboard_check_pressed(ord("R"));

// Ensures movement in 8 directions at a set speed (diagonal is faster)
xdir = right - left;
ydir = down - up;


// State Machine
switch (state) {
	case PLAYERSTATE.FREE: scr_playerstate_free(); break;
	case PLAYERSTATE.SHOOT: scr_playerstate_shoot(); break;
	case PLAYERSTATE.RELOAD: scr_playerstate_reload(); break;
	case PLAYERSTATE.DEAD: scr_playerstate_dead(); break;
	case PLAYERSTATE.HIT: scr_playerstate_hit(); break;
}

// Depth Management
depth = base_depth - 1;

// DELETE LATER
if keyboard_check(ord("1")) change_gun("pistol");
if keyboard_check(ord("2")) change_gun("shotgun");
if keyboard_check(ord("3")) change_gun("smg");
if keyboard_check(ord("4")) change_gun("rifle");
if keyboard_check(ord("5")) change_gun("sniper");

if flare { instance_create_layer(obj_player.x + 25, (obj_player.y - obj_player.sprite_height/2) - 50, "Instances", obj_flare); }
