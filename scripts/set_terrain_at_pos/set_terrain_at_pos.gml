/// @function set_terrain_at_position(xg, yg)
/// @param {real} xg 
/// @param {real} yg 
/// @param {int} terrain_type 

function set_terrain_at_pos(xg, yg, terrain_type){
	
	var this_position_coords = grid_to_coord(xg, yg);
			
	if !ds_map_exists(TERRAIN_TYPES, this_position_coords) {
		ds_list_add(TERRAIN_LOCATIONS, this_position_coords);
	}
	ds_map_replace(TERRAIN_TYPES, this_position_coords, terrain_type);	
}