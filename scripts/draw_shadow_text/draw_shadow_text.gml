/// @arg x
/// @arg y
/// @arg text
/// @arg scale
/// @arg color
/// @arg [rotation=0]
/// @arg [alpha=1]
/// @arg [dropshadow=2]
/// @arg [dropshadow_color]
function draw_shadow_text(){
	var text_x = argument[0];
	var text_y = argument[1];
	var text_string = argument[2];
	var text_scale = argument[3];
	var text_color = argument[4];
	
	var text_rotation = 0;
	var text_alpha = 1;
	var dropshadow_pixels = 2;
	var dropshadow_color = color_darken(text_color, 0.5)
	
	if (argument_count > 5) { text_rotation = argument[5] }
	if (argument_count > 6) { text_alpha = argument[6] }
	if (argument_count > 7) { dropshadow_pixels = argument[7] }	
	if (argument_count > 8) { dropshadow_color = argument[8] }	
	
	draw_simple_text(
		text_x,
		text_y + dropshadow_pixels * text_scale,
		text_string,
		text_scale,
		dropshadow_color,
		text_rotation,
		text_alpha
	);
	
	draw_simple_text(
		text_x,
		text_y,
		text_string,
		text_scale,
		text_color,
		text_rotation,
		text_alpha
	);

}