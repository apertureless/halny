// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_tile_z(xg, yg, zoffset){
	var coords = grid_to_coord(xg, yg);
	// Only check if we have this tile spawned
	if ds_map_exists(TILES_SPAWNED, coords) {
		if !ds_map_exists(TILE_ZOFFSET, coords) {
			var tile_sprite = TILES_SPAWNED[?coords];
			ds_map_add(TILE_START_Y, coords, layer_sprite_get_y(tile_sprite));
			ds_list_add(TILES_WITH_ZOFFSET, coords);
		}
	
		ds_map_replace(TILE_ZOFFSET, coords, zoffset);
	}
	
	
}