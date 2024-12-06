/// @description state machine and inputs
if in_cutscene state = BOSSSTATE.CUTSCENE;

// State Machine
switch (state) {
	case BOSSSTATE.START: scr_bossstate_start(); break;
	case BOSSSTATE.PHASE1: scr_bossstate_phase1(); break;
	case BOSSSTATE.PHASE2: scr_bossstate_phase2(); break;
	case BOSSSTATE.PHASE3: scr_bossstate_phase3(); break;
	case BOSSSTATE.CUTSCENE: if !in_cutscene { state = BOSSSTATE.START; } break;
}

