/// @description 

if keyboard_check_pressed(vk_space) {
	if SPD > 0.5 {
		SPD = 0.5 
		cinema_mode = true
	} else {
		SPD = 1;
		cinema_mode = false
	}
	
}
