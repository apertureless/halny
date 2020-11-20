function update_z() {
	var was_off_ground = z < 0;
	z += zspeed * SLOMO_SECONDS;
	zspeed += GRAVITY_THIS_FRAME;

	z = min(z, 0);
	
	if (z >= 0 && was_off_ground) {
		var width_check = width * 0.5;
		
		for (var dir = 0; dir < 360; dir += 45) {
			var xcheck = x + lengthdir_x(width_check, dir);
			var ycheck = y + lengthdir_y(width_check, dir) * GRID_RATIO;
			//spawn_marker(xcheck, ycheck, c_red, 10, .2);
			var world_pos = world_to_grid(xcheck, ycheck);
			set_tile_z(world_pos[0], world_pos[1], 10);
		}
		
	}
}
