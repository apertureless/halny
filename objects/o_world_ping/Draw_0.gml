lifetime = max(0, lifetime - SECONDS_SINCE_UPDATE)
alpha = lifetime*2;
scale = lerp(scale, 1, 0.35)

draw_sprite_ext(
	sprite_index,
	0,
	x,
	y,
	scale,
	scale,
	0,
	color,
	alpha
)

if lifetime <= 0 {
	instance_destroy();
}