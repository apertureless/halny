/// @function grid_to_world(xg, yg)
/// @param {real} xg The x position in the grid
/// @param {real} yg The y position in the grid

function grid_to_world(xg, yg){
	var xy = 0;
	
	// World x position
	xy[0] = (xg + yg) * (GRID_WIDTH * 0.5); 
	// World y position
	xy[1] = (-xg + yg) * (GRID_HEIGHT * 0.5);
	
	return xy;
}


/// @function world_to_grid(xw, yw)
/// @param {real} xw The x position in the world
/// @param {real} yw The y position in the world

function world_to_grid(xw, yw) {
	
	var xy = 0;
	
	// Grid x position
	xy[0] = round(0.5* (xw / (GRID_WIDTH * 0.5) - (yw / (GRID_HEIGHT * 0.5))));
	// Grid y position
	xy[1] = round(0.5* (xw / (GRID_WIDTH * 0.5) + (yw / (GRID_HEIGHT * 0.5))));
	
	return xy;
}