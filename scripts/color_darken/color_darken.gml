/// @arg color
/// @arg brightness_change
function color_darken(argument0, argument1) {

	var src_color = argument0;
	var brightness_change = argument1;

	var r = color_get_red(src_color);
	var g = color_get_green(src_color);
	var b = color_get_blue(src_color);

	return make_color_rgb(
		clamp(r * brightness_change, 0, 255),
		clamp(g * brightness_change, 0, 255),
		clamp(b * brightness_change, 0, 255),
	)


}
