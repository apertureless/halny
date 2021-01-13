/// @description Movement
moving = false;

#region Decrease Cooldowns
dash_attack_cooldown = max(dash_attack_cooldown - SLOMO_SECONDS, 0);
echo(dash_attack_cooldown);


#endregion

#region Super duper charge
if (keyboard_check_pressed(ord("Q"))) {
	if (dash_attack_cooldown <= 0) {
	
		charge_x_check = mouse_x;
		charge_y_check = mouse_y;
	
		var angle_check_start = point_direction(mouse_x, mouse_y, x, y);
	
		for (var circle_radius = 0; circle_radius <= 60 && !charging; circle_radius += 15) {
			var iterations = (circle_radius/5)+1
			var angle_interval = 360 / iterations;
		
			for (var i = 0; i < iterations && !charging; i++) {
				var angle_to_check = angle_check_start + i * angle_interval;
				var xcheck = charge_x_check + lengthdir_x(circle_radius, angle_to_check);
				var ycheck = charge_y_check + lengthdir_y(circle_radius, angle_to_check) * GRID_RATIO;
			
				if debug_mode {
					if world_pos_open(xcheck, ycheck, true) {
						spawn_marker(xcheck, ycheck, c_lime, 5, .5);
					} else {
						spawn_marker(xcheck, ycheck, c_red, 5, .5);
					}
				}
				
				// Do the charge
				if (world_pos_open(xcheck, ycheck, true)) {
					charge_x_target = xcheck;
					charge_y_target = ycheck;
					charge_direction = point_direction(x, y, charge_x_target, charge_y_target);
					charging = true;
					dash_attack_cooldown = dash_attack_cooldown_max;
					set_camera_shake(7);
				}
			}
		}
	
	}
}
#endregion


if charging {
	// 1. Check distance from current position to target position
	var distance_to_target = point_distance(x, y, charge_x_target, charge_y_target);
	// 3. Calculate the charge distance
	var charge_distance = min(distance_to_target, charge_speed * SLOMO_SECONDS);
	
	x += lengthdir_x(charge_distance, charge_direction);
	y += lengthdir_y(charge_distance, charge_direction);
	
	if point_distance(x, y, charge_x_target, charge_y_target) < 1 {
		charging = false;
	}
	
	// Check for shroom collisions
	// @Todo Refactor later into a more beautiful piece of code.
	var collided_shrooms = ds_list_create();
	var ellipse_height_half = width * 0.5 * GRID_RATIO;
	var ellipse_width_half = width * 0.5;
	
	collision_ellipse_list(
		x - ellipse_width_half, 
		y - ellipse_height_half,
		x + ellipse_width_half,
		y + ellipse_height_half,
		o_shroom,
		false,
		true,
		collided_shrooms,
		false
	);
	
	for (var i = 0; i < ds_list_size(collided_shrooms); i++) {
		with collided_shrooms[|i] {
			instance_destroy();
		}
	}
	
	ds_list_destroy(collided_shrooms)
	
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
