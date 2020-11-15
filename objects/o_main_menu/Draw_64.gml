/// @description Main Menu

font_set(fnt_menu, fa_center, fa_middle);

#region Background

var game_seconds = 3 * GAME_SECONDS_PASSED;

var text_draw_x = display_get_gui_width() * 0.5 + 10 * sin(4 * game_seconds);
var text_draw_y = 200 + 10 * sin(5 * game_seconds);
var text_rotation = 3 * sin(2 * game_seconds);



draw_simple_text(text_draw_x, text_draw_y, game_title, 1, c_mutedpink, text_rotation);

#endregion

#region Foreground

game_seconds += .2;

text_draw_x = display_get_gui_width() * 0.5 + 10 * sin(5 * game_seconds);
text_draw_y = 200 + 10 * sin(4 * game_seconds);
var text_rotation = 3 * sin(2 * game_seconds);




draw_simple_text(text_draw_x, text_draw_y, game_title, 1, c_strongyellow, text_rotation);

#endregion


#region Press Play

font_set(fnt_regular, fa_center, fa_middle);

var helper_text_scale = 0.9 + 0.1 * sin(10 * GAME_SECONDS_PASSED)

draw_simple_text(gui_center_x(), gui_height()*0.75, "PRESS SPACE", helper_text_scale, c_white);
#endregion