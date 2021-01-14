/// @description Listen for inputs


#region Find active gamepad
if CURRENT_GAMEPAD == -1 {
	for(var gp_slot = 0; gp_slot < 5 && CURRENT_GAMEPAD == -1; gp_slot++) {
		
		if gamepad_is_connected(gp_slot) {
			if (
				gamepad_button_check_pressed(gp_slot, gp_start) ||
				gamepad_button_check_pressed(gp_slot, gp_select) ||
				gamepad_button_check_pressed(gp_slot, gp_face1) ||
				gamepad_button_check_pressed(gp_slot, gp_face2) ||
				gamepad_button_check_pressed(gp_slot, gp_face3) ||
				gamepad_button_check_pressed(gp_slot, gp_face4) ||
				gamepad_button_check_pressed(gp_slot, gp_padd) ||
				gamepad_button_check_pressed(gp_slot, gp_padl) ||
				gamepad_button_check_pressed(gp_slot, gp_padu) ||
				gamepad_button_check_pressed(gp_slot, gp_padr) ||
				gamepad_button_check_pressed(gp_slot, gp_shoulderl) ||
				gamepad_button_check_pressed(gp_slot, gp_shoulderr) ||
				gamepad_button_check_pressed(gp_slot, gp_shoulderlb) ||
				gamepad_button_check_pressed(gp_slot, gp_shoulderrb) ||
				abs(gamepad_axis_value(gp_slot, gp_axislh)) > 0.5 ||
				abs(gamepad_axis_value(gp_slot, gp_axisrh)) > 0.5 ||
				abs(gamepad_axis_value(gp_slot, gp_axislv)) > 0.5 ||
				abs(gamepad_axis_value(gp_slot, gp_axisrh)) > 0.5 
			) {
					
				CURRENT_GAMEPAD = gp_slot;
				show_message("GAMEPAD_CONNECTED!")
			}
		}
	}
} else {
	if !gamepad_is_connected(CURRENT_GAMEPAD) {
		CURRENT_GAMEPAD = -1;
	} else {
	
	}
	
	
}

#endregion

#region Update controller state
for (var _input = 0; _input < array_height_2d(INPUT_INFO); _input++) {
	INPUT_STATES[_input] = input_state.none;
	
	#region Keyboard inputs
	var _keyboard_key = INPUT_INFO[_input, input_info.keyboard];
	if keyboard_check_pressed(_keyboard_key) {
		INPUT_STATES[_input] = input_state.pressed;
	}
	
	else if keyboard_check(_keyboard_key) {
		INPUT_STATES[_input] = input_state.held;
	}
	
	else if keyboard_check_released(_keyboard_key) {
		INPUT_STATES[_input] = input_state.released;
	}
	#endregion 
	
	#region Gamepad button inputs
	var _gamepad_key = INPUT_INFO[_input, input_info.controller];
	if gamepad_button_check_pressed(CURRENT_GAMEPAD, _gamepad_key) {
		INPUT_STATES[_input] = input_state.pressed;
	}
	
	else if gamepad_button_check(CURRENT_GAMEPAD, _gamepad_key) {
		INPUT_STATES[_input] = input_state.held;
	}
	
	else if gamepad_button_check_released(CURRENT_GAMEPAD, _gamepad_key) {
		INPUT_STATES[_input] = input_state.released;
	}
	#endregion
}
#endregion