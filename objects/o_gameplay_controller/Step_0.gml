for (var i = ds_list_size(TILES_WITH_ZOFFSET)-1; i >= 0; i--) {
	var this_tile_coords = TILES_WITH_ZOFFSET[|i];
	var this_tile_sprite = TILES_SPAWNED[?this_tile_coords];
	var this_tile_z = TILE_ZOFFSET[?this_tile_coords];
	var this_tile_y_start = TILE_START_Y[?this_tile_coords];
	
	layer_sprite_y(this_tile_sprite, this_tile_y_start + this_tile_z);

	this_tile_z = lerp(this_tile_z, 0, 0.05);

	
	if (abs(this_tile_z) < .5) {
		ds_map_delete(TILE_ZOFFSET, this_tile_coords);
		ds_map_delete(TILE_START_Y, this_tile_coords);
		ds_list_delete(TILES_WITH_ZOFFSET, i);
	} else {
		TILE_ZOFFSET[?this_tile_coords] = this_tile_z;
	}
}

/*
if mouse_check_button(mb_left) {
	var mouse_grid_xy = world_to_grid(mouse_x, mouse_y);
	set_tile_z(mouse_grid_xy[0], mouse_grid_xy[1], 50);
}
*/

if keyboard_check_pressed(ord("R")) {
	room_restart();
}