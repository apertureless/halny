
function input_pressed(input){
	return INPUT_STATES[input] == input_state.pressed
}

function input_held(input) {
	return INPUT_STATES[input] == input_state.held
}

function input_released(input) {
	return INPUT_STATES[input] == input_state.released
}