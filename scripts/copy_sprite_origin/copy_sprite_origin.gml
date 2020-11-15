/// @function copy_sprite_origin(main_sprite, [sprite_to_copy_to])
/// @param {index} main_sprite Source sprite 
/// @param {index} sprite_to_copy_to OPTIONAL!
function copy_sprite_origin() {
	var main_sprite = argument[0];
	var offset = 0;
	offset[0] = sprite_get_xoffset(main_sprite);
	offset[1] = sprite_get_yoffset(main_sprite);
	
	for (var i = 0; i < argument_count; i++) {
		var sprite_to_copy_to = argument[i];
		
		sprite_set_offset(sprite_to_copy_to, offset[0], offset[1]);
	}

}