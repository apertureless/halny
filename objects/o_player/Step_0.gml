/// @description Movement

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
	var movement_direction = point_direction(0, 0, movement_input_x, movement_input_y);
	var movement_per_frame = movespeed_base * SLOMO_SECONDS;
	
	x += lengthdir_x(movement_per_frame, movement_direction);
	y += lengthdir_y(movement_per_frame, movement_direction);
	
	grid_pos = world_to_grid(x, y);
	
	if z >= 0 {
		leg_position *= -1;
		zspeed = -500;
		rotation = 15 * leg_position;
		set_squish(.1);
	}

}

update_z();
update_world_depth();
