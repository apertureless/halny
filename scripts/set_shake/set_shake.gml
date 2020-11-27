// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_camera_shake(shake_amount){
	if !instance_exists(o_camera) throw "No Camera instance found"
	
	with o_camera {
		shake = max(shake, shake_amount)
	}
}