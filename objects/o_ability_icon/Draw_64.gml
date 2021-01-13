/// @description Draw Ability Icon
var dash_cooldown_percentage = 0;
var text_color = c_orange;
var icon_color = c_white;
var border_color = c_white;
var recharge_color = c_strongyellow;

with (o_player) {
	if (dash_attack_cooldown > 0) {
		text_color = c_gray;
		icon_color = c_dkgray;
		border_color = c_black;
		dash_cooldown_percentage = 1-(dash_attack_cooldown / dash_attack_cooldown_max);
	}
}

if dash_cooldown_percentage < 1 {
	var circle_radius = (width * 0.5 * scale * dash_cooldown_percentage) - 2;
	draw_circle_color(x, y, circle_radius, recharge_color, recharge_color, false);
}

draw_sprite_ext(s_ui_action_backdrop, 0, x, y, scale, scale, 0, border_color, 1);
draw_sprite_ext(s_ui_action_icon_dash, 0, x, y, scale, scale, 0, icon_color, 1);

font_set(fnt_regular, fa_right, fa_bottom);

draw_shadow_text(
	x + width * 0.5 * scale, 
	y + height * 0.5 * scale, 
	hotkey_display, 
	scale, 
	text_color,
	0, 
	1, 
	4, 
	color_darken(c_orange, .2)
);