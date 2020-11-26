/// @description 

blink();
update_squish();

anim_timer += SLOMO_SECONDS;

var xdraw_base = x;
var ydraw_base = y - height * 0.5 + z;

limb_image_index[bodypart_head] = is_blinking();
limb_image_index[bodypart_body] = 1

if z < -10 {
	limb_image_index[bodypart_body] += leg_position;
}
	
if moving {
	#region Running animation
	limb_xoffset_target[bodypart_head] = -3 * leg_position;
	limb_xoffset_target[bodypart_hand_back] = -3 * leg_position;
	limb_xoffset_target[bodypart_hand_front] = -3 * leg_position;
	
	limb_yoffset_target[bodypart_head] = 0;
	limb_yoffset_target[bodypart_hand_back] = -3 * leg_position;
	limb_yoffset_target[bodypart_hand_front] = 3 * leg_position;
	
	#endregion
} else {
	
	#region Idle Animation
	limb_yoffset_target[bodypart_hand_back] = 2 * sin(3*anim_timer);
	limb_yoffset_target[bodypart_hand_front] = -2 * sin(3*anim_timer);
	
	var head_dir = 360 * anim_timer;
	var head_dist = 2;
	
	limb_xoffset_target[bodypart_head] = lengthdir_x(head_dist, head_dir);
	limb_yoffset_target[bodypart_head] = .5 * lengthdir_y(head_dist, head_dir);
	// limbs_yoffset[bodypart_head] = -2 * sin(2*anim_timer);
	#endregion
}

#region Draw Limb

var _rotation = rotation * xscale;

for (var i = 0; i < array_length_1d(limb_direction); i++) {
	
	var this_limb_dir = limb_direction[i] + _rotation;
	var this_limb_rot = limb_rotation_base[i] + _rotation;
	
	limb_xoffset[i] = lerp(limb_xoffset[i], limb_xoffset_target[i], limb_lerp_speed[i]);
	limb_yoffset[i] = lerp(limb_yoffset[i], limb_yoffset_target[i], limb_lerp_speed[i]);
	
	draw_sprite_ext(
		limb_sprite[i], 
		limb_image_index[i],
		xdraw_base + (lengthdir_x(limb_distance[i], this_limb_dir)+limb_xoffset[i]) * xscale,
		ydraw_base + lengthdir_y(limb_distance[i], this_limb_dir)+limb_yoffset[i],
		limb_xscale[i]*xscale,
		limb_yscale[i],
		this_limb_rot * xscale,
		c_white,
		1
	)	
}
#endregion

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
