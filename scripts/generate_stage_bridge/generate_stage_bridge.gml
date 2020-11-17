/// @function generate_stage_bridge(current_x, current_y, dest_x, dest_y)
/// @param {real} current_x source x coordinate
/// @param {real} current_y source y coordinate
/// @param {real} dest_x destination x coordinate
/// @param {real} dest_y destination y coordinate

function generate_stage_bridge(current_x, current_y, dest_x, dest_y) {
	
	while !(current_x == dest_x && current_y == dest_y) {
		set_terrain_at_pos(current_x, current_y, terrain_type.bridge)
		var dir_to_move = point_direction(current_x, current_y, dest_x, dest_y);
		dir_to_move = round_to_nearest(dir_to_move, 90) + choose(-90, 0, 90);
		current_x = round(current_x + lengthdir_x(1, dir_to_move));
		current_y = round(current_y + lengthdir_y(1, dir_to_move));
	}


}
