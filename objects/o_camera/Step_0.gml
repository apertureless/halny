/// @description Follow Entity

if instance_exists(instance_target) {
	x = lerp(x, instance_target.x, lerp_speed);
	y = lerp(y, instance_target.y, lerp_speed);
}

camera_set_view_pos(view_camera[0], x - view_width() * 0.5, y - view_height() * 0.5);