randomize();

#macro rgb make_color_rgb

#macro c_strongyellow make_color_rgb(255, 195, 33)
#macro c_mutedpink make_color_rgb(87, 49, 61)
#macro c_mutedblue make_color_rgb(105, 139, 194)
#macro c_muteddarkred make_color_rgb(39, 6, 6)


init_time();
init_grid();
init_stage_generation();

globalvar GRAVITY; GRAVITY = 4000;

globalvar BACKGROUND_DEPTH; BACKGROUND_DEPTH = 60000;
globalvar TERRAIN_DEPTH; TERRAIN_DEPTH = 50000;
globalvar SHADOW_DEPTH; SHADOW_DEPTH = 40000;

copy_sprite_origin(s_grass_tile, s_dirt, s_edge);

room_goto(rm_mainmenu);
