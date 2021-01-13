/// @description Insert description here
draw_sprite_ext(s_ui_action_backdrop, 0, x, y, scale, scale, 0, c_white, 1);
draw_sprite_ext(s_ui_action_icon_dash, 0, x, y, scale, scale, 0, c_white, 1);

font_set(fnt_regular, fa_right, fa_bottom);

draw_shadow_text(
	x + width * 0.5 * scale, 
	y + height * 0.5 * scale, 
	hotkey_display, 
	scale, 
	c_orange,
	0, 
	1, 
	4, 
	color_darken(c_orange, .2)
);