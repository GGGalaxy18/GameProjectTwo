/// @description variable declarations
xdir = 0;
ydir = 0;
base_depth = depth;

// control declarations
left = noone;
right = noone;
up = noone;
down = noone;
sprint = noone;
//dash = noone;
//melee_attack = noone;
shoot = noone;
//reload = noone;

state = PLAYERSTATE.FREE;

// shoot state vars
player_shot = false;
shoot_timer = 0;
draw_bullets = false;
bullets = [];
bullet_timer = 0;
equipped_gun = "pistol";

// gun information
max_magazine = {
	"pistol": 12,
	"shotgun": 8,
	"smg": 20,
	"rifle": 25,
	"sniper": 5
};
bullet_range = {
	"pistol": 600,
	"shotgun": 300,
	"smg": 600,
	"rifle": 900,
	"sniper": 1500
};
fire_rate = {
	"pistol": 5,
	"shotgun": 30,
	"smg": 2,
	"rifle": 10/3,
	"sniper": 30
};
bullet_damage = {
	"pistol": 10,
	"shotgun": 5,
	"smg": 10,
	"rifle": 15,
	"sniper": 50
};
reload_speed = {
	"pistol": 45,
	"shotgun": 60,
	"smg": 30,
	"rifle": 60,
	"sniper": 90
}