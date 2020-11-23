
function coord_to_world(_coords) {
	var grid = coord_to_grid(_coords)
	var world_xy = grid_to_world(grid[0], grid[1])
	return world_xy;
}
