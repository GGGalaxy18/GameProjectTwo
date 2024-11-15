/// @description state machine

// State Machine
switch (state) {
	case ENEMYSTATE.SHROUDED: scr_enemystate_shrouded(); break;
	case ENEMYSTATE.REVEALED: scr_enemystate_revealed(); break;
	case ENEMYSTATE.ATTACK: scr_enemystate_attack(); break;
	case ENEMYSTATE.DEAD: scr_enemystate_dead(); break;
	case ENEMYSTATE.HIT: scr_enemystate_hit(); break;
}

// Depth Management
depth = base_depth - 1;

// Used for debugging issues with overlapping enemy spawns
/*
if !obj_level_controller.is_scrolling {
	if ev_outside_view0 {
		x = clamp(x, camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + view_wport);
		y = clamp(y, camera_get_view_y(view_camera[0]), camera_get_view_y(view_camera[0]) + view_hport);
	}
}*/