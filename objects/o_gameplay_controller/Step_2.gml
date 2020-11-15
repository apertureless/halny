/// @description 

if keyboard_check_pressed(vk_space) {
	if SPD > 0.5 {
		SPD = 0.5 
	} else {
		SPD = 1;
	}
	
}

if keyboard_check_pressed(ord("R")) {
	room_restart();
}