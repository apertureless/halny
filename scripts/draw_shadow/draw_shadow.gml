function draw_shadow() {
	var shadow_scale = width / sprite_get_width(s_shadow);

	draw_sprite_ext(s_shadow, 0, x, y, shadow_scale, shadow_scale, 0, c_white, .25);


}
