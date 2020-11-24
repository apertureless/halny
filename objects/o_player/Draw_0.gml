/// @description 

blink();
update_squish();
anim_timer += SLOMO_SECONDS;

var xdraw_base = x;
var ydraw_base = y - height * 0.5 + z;

limb_image_index[bodypart_head] = is_blinking();
limbs_yoffset[bodypart_hand_back] = 3 * sin(4*anim_timer);
limbs_yoffset[bodypart_hand_front] = -3 * sin(4*anim_timer);
limbs_yoffset[bodypart_head] = -2 * sin(2*anim_timer);


for (var i = 0; i < array_length_1d(limb_direction); i++) {
	
	var this_limb_dir = limb_direction[i] + rotation;
	var this_limb_rot = limb_rotation_base[i] + rotation;
	
	draw_sprite_ext(
		limb_sprite[i], 
		limb_image_index[i],
		xdraw_base + lengthdir_x(limb_distance[i], this_limb_dir)+limbs_xoffset[i],
		ydraw_base + lengthdir_y(limb_distance[i], this_limb_dir)+limbs_yoffset[i],
		limb_xscale[i],
		limb_yscale[i],
		this_limb_rot,
		c_white,
		1
	)	
}

var rotation_target = 0;
var rotation_speed = 0.45;

if z >= 0 {
	rotation_target = 0;
} else {
	if zspeed < 0 {
		rotation_target = 10 * leg_position;
	} else {
		rotation_speed = 0.05;
		rotation_target = 0;
	}
}

rotation = lerp(rotation, rotation_target, rotation_speed);
