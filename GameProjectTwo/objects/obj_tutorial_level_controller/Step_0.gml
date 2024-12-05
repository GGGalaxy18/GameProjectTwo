#region camera movement
if instance_exists(obj_player) {
	var _cam_movement_offset = 500;
	if obj_player.x > camera_get_view_x(view_camera[0]) + view_wport - _cam_movement_offset {
		cam_scroll = min(4, obj_player.x - (camera_get_view_x(view_camera[0]) + view_wport - _cam_movement_offset));
		camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + cam_scroll, camera_get_view_y(view_camera[0]));
		is_scrolling = true;
	} else { is_scrolling = false; cam_scroll = 0; }

	obj_player.x = clamp(obj_player.x, camera_get_view_x(view_camera[0]) + 16, camera_get_view_x(view_camera[0]) + view_wport - 16);
}
#endregion

#region register tasks
if instance_exists(obj_player) {
	lowest_health = min(lowest_health, health);
	lowest_grenade = min(lowest_grenade, obj_player.cur_grenades);
	crate_existed = crate_existed or instance_exists(obj_tutorial_crate);
	var _task = checkpoint_tasks[checkpoint_index];
	switch (checkpoint_index) {
		case 0: _task[$ "W"] = _task[$ "W"] or obj_player.up;
				_task[$ "A"] = _task[$ "A"] or obj_player.left;
				_task[$ "S"] = _task[$ "S"] or obj_player.down;
				_task[$ "D"] = _task[$ "D"] or obj_player.right;
		case 1: _task[$ "sprint"] = _task[$ "sprint"] or obj_player.sprint;
		case 2: _task[$ "shoot"] = _task[$ "shoot"] or obj_player.shoot;
		case 3: _task[$ "grenade"] = _task[$ "grenade"] or obj_player.grenade;
		case 4: _task[$ "crate_shot"] = _task[$ "crate_shot"] or (crate_existed and !instance_exists(obj_crate_temp));
				_task[$ "crate_looted"] = _task[$ "crate_looted"] or (lowest_grenade < obj_player.cur_grenades);
		case 5: _task[$ "flare"] = _task[$ "flare"] or obj_player.flare;
		case 6: _task[$ "heal"] = _task[$ "heal"] or (lowest_health < health);
	}
}
#endregion

#region crate spawn
if array_contains([4,6], checkpoint_index) {
	var _crate_struct = {
		"set_loot": true,
		"loot": obj_grenade_pickup,
		"loot_quantity": 1
	}
	if checkpoint_index == 6 { _crate_struct[$ "loot"] = obj_health_pickup; }
	if instance_number(obj_tutorial_crate) + instance_number(obj_grenade_pickup) + instance_number(obj_health_pickup) < 1 {
		var _spawn_crate = true;
		switch checkpoint_index {
			case 4: if (checkpoint_tasks[4][$ "crate_looted"]) { _spawn_crate = false; } break;
			case 6: if (checkpoint_tasks[6][$ "heal"]) { _spawn_crate = false; } break;
		}
		if _spawn_crate {
			instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_tutorial_crate, _crate_struct);
		}
	}
}
#endregion

#region enemy spawn
if array_contains([2,3,5], checkpoint_index) {
	if instance_number(obj_enemy) < 1 {
		var _create_enemy = true;
		switch checkpoint_index {
			case 2: if (checkpoint_tasks[2][$ "shoot"]) { _create_enemy = false; } break;
			case 3: if (checkpoint_tasks[3][$ "grenade"]) { _create_enemy = false; } break;
			case 5: if (checkpoint_tasks[5][$ "flare"]) { _create_enemy = false; } break;
		}
		if _create_enemy {
			instance_create_layer(x, y, "Instances", obj_enemy);
			checkpoint_tasks[checkpoint_index][$ "enemy_dead"] = false;
		} else { checkpoint_tasks[checkpoint_index][$ "enemy_dead"] = true; }
	}
}
#endregion

#region move to next tutorial checkpoint
var _next_checkpoint = checkpoint_index + 1;
if instance_exists(obj_player) {
	if !checkpoint_tasks[6][$ "heal"] and health < obj_player.max_health {
		_next_checkpoint = 6;
	}
	var _moved_checkpoint = false;
	// Set next checkpoint
	var _task = checkpoint_tasks[checkpoint_index];
	switch (checkpoint_index) {
		case 0:
		if (_task[$ "W"] and _task[$ "A"] and _task[$ "S"] and _task[$ "D"]) { checkpoint_completed[checkpoint_index] = true; prev_checkpoint = checkpoint_index; checkpoint_index = _next_checkpoint; _moved_checkpoint = true; } break;
		case 1: if (_task[$ "sprint"]) { checkpoint_completed[checkpoint_index] = true; prev_checkpoint = checkpoint_index; checkpoint_index = _next_checkpoint; _moved_checkpoint = true; } break;
		case 2: if (_task[$ "shoot"] and _task[$ "enemy_dead"]) { checkpoint_completed[checkpoint_index] = true; prev_checkpoint = checkpoint_index; checkpoint_index = _next_checkpoint; _moved_checkpoint = true; } break;
		case 3: if (_task[$ "grenade"] and _task[$ "enemy_dead"]) { checkpoint_completed[checkpoint_index] = true; prev_checkpoint = checkpoint_index; checkpoint_index = _next_checkpoint; _moved_checkpoint = true; } break;
		case 4: if (_task[$ "crate_shot"] and _task[$ "crate_looted"]) { checkpoint_completed[checkpoint_index] = true; prev_checkpoint = checkpoint_index; checkpoint_index = _next_checkpoint; _moved_checkpoint = true; } break;
		case 5: if (_task[$ "flare"] and _task[$ "enemy_dead"]) { checkpoint_completed[checkpoint_index] = true; prev_checkpoint = checkpoint_index; checkpoint_index = _next_checkpoint; _moved_checkpoint = true; } break;
		case 6: if (_task[$ "heal"]) { checkpoint_completed[checkpoint_index] = true; checkpoint_index = ++prev_checkpoint; _moved_checkpoint = true; } break;
	}
	if _moved_checkpoint {
		instance_create_layer(x, y, "Instances", related_dialog[checkpoint_index]);
		show_debug_message(prev_checkpoint)
	}
}
#endregion
show_debug_message(checkpoint_completed);