/// @description variable declarations
xdir = 0;
ydir = 0;
base_depth = depth;
image_xscale = .22;
image_yscale = .22;

// control declarations
left = noone;
right = noone;
up = noone;
down = noone;
sprint = noone;
//dash = noone;
//melee_attack = noone;
shoot = noone;
grenade = noone;
flare = noone;
reload = noone;

state = PLAYERSTATE.FREE;

// shoot state vars
player_shot = false;
shoot_timer = 0;
draw_bullets = false;
drawn_bullets = [];
bullets = [];
bullet_timer = 0;
equipped_gun = "pistol";
current_magazine = 12;

// reload state vars
reload_timer = 0;

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
	"pistol": 10,
	"shotgun": 30,
	"smg": 5,
	"rifle": 20,
	"sniper": 45
};
bullet_damage = {
	"pistol": 10,
	"shotgun": 5,
	"smg": 5,
	"rifle": 7,
	"sniper": 50
};
reload_speed = {
	"pistol": 45,
	"shotgun": 60,
	"smg": 30,
	"rifle": 60,
	"sniper": 90
}


// player health
health = max_health;

// player stamina
stamina = max_stamina;
stamina_recharge = 2;
recharge_delay = 60;
recharge_delay_timer = 0;
sprint_consumption = 4;

// flare
flare_consumption = 100;

// grenades
max_grenades = 3
// will be made dynamic later
cur_grenades = 3
grenade_timer = 30;

// cutscene
in_cutscene = false;

// foot hitbox
hitbox_struct = {
	instance_to_follow: id,
	y_offset: 0
}
instance_create_layer(x, y, "Instances", obj_foot_hitbox, hitbox_struct);