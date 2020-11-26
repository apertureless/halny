
function world_pos_open(x_target, y_target) {
	var ignore_solid = false;
	if argument_count > 2 {
		ignore_solid = argument[2]
	}
	var grid_destination = world_to_grid(x_target, y_target);
	var destionation_coords = grid_to_coord(grid_destination[0], grid_destination[1]);
	
	// Check if tile exsists at wanted movement position
	
	return ds_map_exists(TILES_SPAWNED, destionation_coords) && (ignore_solid || place_free(x_target, y_target))
	
}