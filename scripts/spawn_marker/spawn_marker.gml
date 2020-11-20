// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawn_marker(_x, _y, _color, _radius, _lifetime){
	with instance_create(o_marker, _x, _y) {
		color = _color;
		radius = _radius;
		lifetime = _lifetime;
	}

}