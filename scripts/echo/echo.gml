/// @arg arguments
function echo() {

	var _debug_message = "";

	for (var i = 0; i < argument_count; i++) {
		_debug_message += string(argument[i]) + " ";
	}

	show_debug_message(_debug_message);


}
