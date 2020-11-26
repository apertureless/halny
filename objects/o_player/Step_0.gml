/// @description Movement
moving = false;

#region Super duper charge
if (mouse_check_button_pressed(mb_left)) {
	charge_x_target = mouse_x;
	charge_y_target = mouse_y;
	charging = true;
}
#endregion

if charging {
	// 1. Check distance from current position to target position
	var distance_to_target = point_distance(x, y, charge_x_target, charge_y_target);
	// 2. Check direction
	var direction_to_target = point_direction(x, y, charge_x_target, charge_y_target);
	// 3. Calculate the charge distance
	var charge_distance = min(distance_to_target, charge_speed * SLOMO_SECONDS);
	
	x += lengthdir_x(charge_distance, direction_to_target);
	y += lengthdir_y(charge_distance, direction_to_target);
	
	if point_distance(x, y, charge_x_target, charge_y_target) < 1 {
		charging = false;
	}
	
} else {
	
	#region Keyboard Inputs
	var movement_input_x = 0;
	var movement_input_y = 0;

	for (var i = 0; i < array_length_1d(keyboard_inputs); i++) {
		if keyboard_check(keyboard_inputs[i]) {
			var _movement_direction = 90 * i;
			movement_input_x += lengthdir_x(1, _movement_direction)
			movement_input_y += lengthdir_y(1, _movement_direction)
		}
	}

	if movement_input_x != 0 {
		xscale = sign(movement_input_x);
	}

	if (abs(movement_input_x) != 0 || abs(movement_input_y) != 0) {
		moving = true;
		var movement_direction = point_direction(0, 0, movement_input_x, movement_input_y * GRID_RATIO);
		var movement_per_frame = movespeed_base * SLOMO_SECONDS;
	
		world_move(movement_per_frame, movement_direction);
	
		grid_pos = world_to_grid(x, y);
	
		if z >= 0 {
			leg_position *= -1;
			zspeed = -500;
			set_squish(.1);
		}

	}

	#endregion
	
	if (z > 0) {
		moving = true;
	}

	update_z();
} 

update_world_depth();
