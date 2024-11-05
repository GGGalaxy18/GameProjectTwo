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