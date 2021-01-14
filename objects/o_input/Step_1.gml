/// @description Listen for inputs

for (var _input = 0; _input < array_height_2d(INPUT_INFO); _input++) {
	INPUT_STATES[_input] = input_state.none;
	
	if keyboard_check_pressed(INPUT_INFO[_input, input_info.keyboard]) {
		INPUT_STATES[_input] = input_state.pressed;
	}
	
	else if keyboard_check(INPUT_INFO[_input, input_info.keyboard]) {
		INPUT_STATES[_input] = input_state.held;
	}
	
	else if keyboard_check_released(INPUT_INFO[_input, input_info.keyboard]) {
		INPUT_STATES[_input] = input_state.released;
	}
}
