// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_rectangle_center(x_center, y_center, _width, _height, _color, _outline ){
	_wd = _width * 0.5;
	_ht = _height * 0.5
	
	draw_rectangle_color(
		x_center - _wd,
		y_center - _ht,
		x_center + _wd,
		y_center + _ht,
		_color,
		_color,
		_color,
		_color,
		_outline
	)

}