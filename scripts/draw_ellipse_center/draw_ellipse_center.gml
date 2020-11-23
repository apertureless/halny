// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_ellipse_center(x_center, y_center, _width, _height, _color, _outline){
	_wd = _width * 0.5;
	_ht = _height * 0.5
	_alpha = 1;
	if argument_count > 6 {
		_alpha = argument[6]
		draw_set_alpha(_alpha)
	}
	
	
	draw_ellipse_color(
		x_center - _wd,
		y_center - _ht,
		x_center + _wd,
		y_center + _ht,
		_color,
		_color,
		_outline
	);
	
	draw_set_alpha(1)
}