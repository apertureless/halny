with o_world_entity {
	var hitbox_height = width * GRID_RATIO; 
	draw_ellipse_center(x, y, width, hitbox_height, c_lime, false, 0.25)
	draw_ellipse_center(x, y, width, hitbox_height, c_lime, true)
	draw_line_color(x-width*.5, y, x-width*.5, y-height, c_lime, c_lime)
	draw_line_color(x+width*.5, y, x+width*.5, y-height, c_lime, c_lime)
	draw_ellipse_center(x, y-height, width, hitbox_height, c_lime, true)
}