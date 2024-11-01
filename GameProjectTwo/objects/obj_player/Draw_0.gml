// @description draw bullet tracers
draw_self();

if (draw_bullets) {
	bullet_timer++;
	for (var _i=0; _i<array_length(bullets); _i++) {
		draw_line(bullets[_i][0], bullets[_i][1], bullets[_i][2], bullets[_i][3]);
	}
	if bullet_timer > 10 {
		bullet_timer = 0;
		draw_bullets = false;
		bullets = [];
	}
}