
function animator_limb_setup(
	limb_id, 
	xoffset, 
	yoffset, 
	l_sprite, 
	rotation_base, 
	l_xscale, 
	l_yscale
) {
	
	limb_xoffset[limb_id] = xoffset;
	limb_yoffset[limb_id] = yoffset;
	
	limb_yoffset_target[limb_id] = 0;
	limb_xoffset_target[limb_id] = 0;
	
	limb_lerp_speed[limb_id] = .25;
	
	limb_sprite[limb_id] = l_sprite;
	limb_rotation_base[limb_id] = rotation_base;
	
	limb_xscale[limb_id] = l_xscale;
	limb_yscale[limb_id] = l_yscale;
	
	limb_image_index[limb_id] = 0;
	
	limb_distance[limb_id] = 0;
	limb_direction[limb_id] = 0;
}