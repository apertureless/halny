function init_grid() {
	globalvar GRID_WIDTH; GRID_WIDTH = 128;
	globalvar GRID_HEIGHT; GRID_HEIGHT = 64;
	globalvar GRID_RATIO; GRID_RATIO = GRID_HEIGHT / GRID_WIDTH;
	globalvar GRID_BUFFER; GRID_BUFFER = buffer_create(4, buffer_fixed, 1);


}
