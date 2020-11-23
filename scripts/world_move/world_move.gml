// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function world_move(move_distance, move_direction){
	var x_target = x + lengthdir_x(move_distance, move_direction);
	var y_target = y + lengthdir_y(move_distance, move_direction);
	
	//spawn_marker(x_target, y_target, c_red, 5, .1);
	
	// Only move if we are on a tile.
	if (world_pos_open(x_target, y_target)) {	
		x = x_target;
		y = y_target;
		return true;
	} else {
		// Angle Sweep for sliding
		
		for (var angle_sweep = 10; angle_sweep <= 90; angle_sweep += 10) {
			for (var dir = -1; dir <= 1; dir += 2) {
				var angle_check = move_direction + (dir * angle_sweep);
				var xcheck = x + lengthdir_x(move_distance, angle_check);
				var ycheck = y + lengthdir_y(move_distance, angle_check);
				
				if (world_pos_open(xcheck, ycheck)) {
					x = xcheck;
					y = ycheck;
					return true;
				} 
					
			}
		}
	}
	
	return false
}