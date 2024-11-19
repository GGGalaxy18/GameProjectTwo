/// @description enemy tracker

enemies_killed = [{ "default": 0,
					"flying": 0 },
				  { "default": 0,
					"flying": 0 },
				  { "default": 0,
					"flying": 0 },
				  { "default": 0,
					"flying": 0 },
				  { "default": 0,
					"flying": 0 },
				  { "default": 0,
					"flying": 0 }];
					
breakpoint_index = 0;
enemy_spawn_timer = 0;
enemy_spawn_time = 60;

level_breakpoints = [];
default_enemy_breakdown = [];
flying_enemy_breakdown = [];

if breakpoint1 != "noone" {
	var _nums = string_split(breakpoint1, " ");
	array_push(level_breakpoints, int64(_nums[0]));
	array_push(default_enemy_breakdown, int64(_nums[1]));
	array_push(flying_enemy_breakdown, int64(_nums[2]));
}
if breakpoint2 != "noone" {
	var _nums = string_split(breakpoint2, " ");
	array_push(level_breakpoints, int64(_nums[0]));
	array_push(default_enemy_breakdown, int64(_nums[1]));
	array_push(flying_enemy_breakdown, int64(_nums[2]));
}
if breakpoint3 != "noone" {
	var _nums = string_split(breakpoint3, " ");
	array_push(level_breakpoints, int64(_nums[0]));
	array_push(default_enemy_breakdown, int64(_nums[1]));
	array_push(flying_enemy_breakdown, int64(_nums[2]));
}
if breakpoint4 != "noone" {
	var _nums = string_split(breakpoint4, " ");
	array_push(level_breakpoints, int64(_nums[0]));
	array_push(default_enemy_breakdown, int64(_nums[1]));
	array_push(flying_enemy_breakdown, int64(_nums[2]));
}
if breakpoint5 != "noone" {
	var _nums = string_split(breakpoint5, " ");
	array_push(level_breakpoints, int64(_nums[0]));
	array_push(default_enemy_breakdown, int64(_nums[1]));
	array_push(flying_enemy_breakdown, int64(_nums[2]));
}
if breakpoint6 != "noone" {
	var _nums = string_split(breakpoint6, " ");
	array_push(level_breakpoints, int64(_nums[0]));
	array_push(default_enemy_breakdown, int64(_nums[1]));
	array_push(flying_enemy_breakdown, int64(_nums[2]));
}
					
current_breakpoint = level_breakpoints[0];

cam_scroll = 0;
is_scrolling = false;