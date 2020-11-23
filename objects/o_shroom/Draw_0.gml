anim_timer += SLOMO_SECONDS;

set_squish(.05*sin(2*anim_timer));

draw_sprite_ext(
	sprite_index, 
	image_index, 
	x, 
	y, 
	xscale * scalemod * squish_xscale,
	scalemod * squish_yscale, 
	rotation, 
	c_white, 
	1
);

//update_squish();