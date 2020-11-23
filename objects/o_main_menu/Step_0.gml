/// @description Check for input

if (keyboard_check_pressed(vk_space)) {	
	room_goto(rm_gameplay);
	//transition_start(rm_gameplay, sq_slide_out_diagonal, sq_slide_in_diagonal);
}
