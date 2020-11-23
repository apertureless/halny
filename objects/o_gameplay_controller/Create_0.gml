/// @description 

instance_create(o_world_background);
instance_create(o_shadow_draw);
var player_instance = instance_create(o_player, 0, 0);

instance_create(o_camera, 0, 0);
set_camera_target(player_instance);
generate_stage();

if debug_mode {
	instance_create(o_hitbox_draw);
}