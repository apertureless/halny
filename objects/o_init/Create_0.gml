randomize();

#macro rgb make_color_rgb

#macro c_strongyellow make_color_rgb(255, 195, 33)
#macro c_mutedpink make_color_rgb(87, 49, 61)
#macro c_mutedblue make_color_rgb(105, 139, 194)
#macro c_muteddarkred make_color_rgb(39, 6, 6)
#macro c_toxix_green make_color_rgb(25, 140, 120);

init_time();
init_grid();
init_stage_generation();
init_inputs();

globalvar GRAVITY; GRAVITY = 4000;

globalvar BACKGROUND_DEPTH; BACKGROUND_DEPTH = 60000;
globalvar TERRAIN_DEPTH; TERRAIN_DEPTH = 50000;
globalvar SHADOW_DEPTH; SHADOW_DEPTH = 40000;

globalvar CURSOR_XGUI; CURSOR_XGUI = 0;
globalvar CURSOR_YGUI; CURSOR_YGUI = 0;

globalvar CURSOR_XWORLD; CURSOR_XWORLD = 0;
globalvar CURSOR_YWORLD; CURSOR_YWORLD = 0;

copy_sprite_origin(s_grass_tile, s_dirt, s_edge);

set_resolution();
instance_create(o_cursor);
room_goto(rm_mainmenu);
