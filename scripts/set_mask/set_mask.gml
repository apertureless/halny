// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_mask(_width){
	width = _width;
	mask_index = s_mask_circular;
	image_xscale = _width / sprite_get_width(s_mask_circular);
	image_yscale = image_xscale * GRID_RATIO;
}