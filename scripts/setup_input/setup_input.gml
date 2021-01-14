/// @function setup_inputs(id, name, keyboard_key, controller_key);
/// @param {index} id action enum
/// @param {string} name action name
/// @param {string} keyboard_key action keyboard key
/// @param {string} controller_key action controller key
function setup_input(input_id, input_name, input_keyboard_key, input_controller_key){
	INPUT_INFO[input_id, input_info.name] = input_name;
	INPUT_INFO[input_id, input_info.keyboard_default] = input_keyboard_key;
	INPUT_INFO[input_id, input_info.controller_default] = input_controller_key;
	INPUT_INFO[input_id, input_info.keyboard] = input_keyboard_key;
	INPUT_INFO[input_id, input_info.controller] = input_controller_key;
	
	INPUT_STATES[input_id] = input_state.none;
}