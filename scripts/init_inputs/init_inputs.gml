function init_inputs(){
	// All available actions
	enum input_action {
		walk_right,
		walk_up,
		walk_left,
		walk_down,
		dash
	}
	
	// Info for each action
	enum input_info {
		name,
		controller,
		keyboard,
		controller_default,
		keyboard_default,
	}
	
	enum input_state {
		none,
		pressed,
		held,
		released
	}
	
	globalvar CURRENT_GAMEPAD;
	globalvar INPUT_INFO;
	globalvar INPUT_STATES;
	
	CURRENT_GAMEPAD = -1;
	
	setup_input(input_action.walk_right, "Walk right", ord("D"), gp_padr);
	setup_input(input_action.walk_up, "Walk up", ord("W"), gp_padu);
	setup_input(input_action.walk_left, "Walk left", ord("A"), gp_padl);
	setup_input(input_action.walk_down, "Walk down", ord("S"), gp_padd);
	setup_input(input_action.dash, "Dash attack", ord("Q"), gp_face1);
	
	instance_create(o_input);
}