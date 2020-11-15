/// @arg object
/// @arg [x=0]
/// @arg [y=0]
function instance_create() {

	var object_id = argument[0];
	var x_pos = 0;
	var y_pos = 0;

	if (argument_count > 1) { x_pos = argument[1] }
	if (argument_count > 2) { y_pos = argument[2] }
	return instance_create_depth(x_pos, y_pos, 0, object_id);


}
