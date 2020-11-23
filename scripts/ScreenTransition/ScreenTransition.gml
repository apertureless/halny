globalvar MID_TRANSITION; MID_TRANSITION = false;
globalvar ROOM_TARGET; ROOM_TARGET = -1;

function transition_place_sequence(_type) {
	if (layer_exists("transition")) {
		layer_destroy("transition");
	}
	
	var _layer = layer_create(-9999, "transition");
	layer_sequence_create(
		_layer, 
		view_width() * 0.5,
		view_height() * 0.5,
		_type
	);
}

function transition_start(_room_target, _type_out, _type_in) {

	if (!global.MID_TRANSITION) {
		
		global.MID_TRANSITION = true;
		global.ROOM_TARGET = _room_target;
		
		transition_place_sequence(_type_out);
		layer_set_target_room(_room_target);
		transition_place_sequence(_type_in);
		layer_reset_target_room();
		return true
	}
	return false
}

function transition_change_room() {
	room_goto(global.ROOM_TARGET);
}

function transition_finished() {
	layer_sequence_destroy(self.elementID);
	global.MID_TRANSITION = false;
}