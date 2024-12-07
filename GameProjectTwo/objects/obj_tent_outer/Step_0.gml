if player_in {
	image_alpha -= 1/45;
	image_alpha = max(0, image_alpha);
} else {
	image_alpha += 1/45;
	image_alpha = min(1, image_alpha);
}
