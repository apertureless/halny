/// @description Insert description here
draw_fullscreen_color(rgb(0, 20, 50), 1, rgb(25, 140, 120));

var aurora_camera_influence = [0.8, 0.3];
var aurora_scales = [.4, 1];

for (var i = 0; i < array_length_1d(aurora_camera_influence); i++) {
	
	aurora_x[i] += auroda_xspeed * SLOMO_SECONDS;
	aurora_y[i] += auroda_yspeed * SLOMO_SECONDS;
	
	draw_sprite_tiled_ext(
		s_background_aurora, 
		0, 
		(view_center_x() * aurora_camera_influence[i]) + aurora_x[i] * (1 - aurora_camera_influence[i]), 
		(view_center_y() * aurora_camera_influence[i]) + aurora_y[i] * (1 - aurora_camera_influence[i]),
		aurora_scales[i],
		aurora_scales[i],
		c_white,
		1
	);
}


