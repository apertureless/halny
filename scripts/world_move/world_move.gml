// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function world_move(move_distance, move_direction){
	var x_target = x + lengthdir_x(move_distance, move_direction);
	var y_target = y + lengthdir_y(move_distance, move_direction);
	
	spawn_marker(x_target, y_target, c_red, 5, .1);
	
	var grid_destination = world_to_grid(x_target, y_target);
	var destionation_coords = grid_to_coord(grid_destination[0], grid_destination[1]);
	
	// Only move if we are on a tile.
	if (ds_map_exists(TILES_SPAWNED, destionation_coords)) {	
		x = x_target;
		y = y_target;
	}
}