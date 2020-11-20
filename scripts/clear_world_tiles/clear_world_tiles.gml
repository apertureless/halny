// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function clear_world_tiles() {
	if (layer_exists(WORLD_LAYER)) {
		layer_destroy(WORLD_LAYER);
	}
	
	ds_map_clear(TERRAIN_TYPES);
	ds_map_clear(TILES_SPAWNED);
	ds_map_clear(TILE_ZOFFSET);
	ds_map_clear(TILE_START_Y);
	
	ds_list_clear(ROOM_CENTERS);
	ds_list_clear(TERRAIN_LOCATIONS);
	ds_list_clear(TILES_WITH_ZOFFSET);
}