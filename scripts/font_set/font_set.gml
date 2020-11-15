/// @arg font
/// @arg halign
/// @arg valign
function font_set(argument0, argument1, argument2) {

	var _font = argument0;
	var _halign = argument1;
	var _valign = argument2;

	draw_set_font(_font);
	draw_set_halign(_halign);
	draw_set_valign(_valign);



}
