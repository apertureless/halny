/// @arg x
/// @arg y
/// @arg [color=c_white]
function spawn_world_ping(){
	var target_x = argument[0];
	var target_y = argument[1];
	var ping_color = c_white;
	
	if (argument_count > 2) { ping_color = argument[2] }
	
	with instance_create(o_world_ping, target_x, target_y) {
		color = ping_color;
	}
}