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
drawn_bullets = [];
bullets = [];
bullet_timer = 0;
equipped_gun = "pistol";
current_magazine = 0;

// DELETE LATER
instance_create_depth(x, y, 0, obj_pistol);

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



//Player health bar setup
max_health = 8;
hp = max_health;
health = hp;

//grenades
max_grenades = 3
// will be made dynamic later
cur_grenades = 3

