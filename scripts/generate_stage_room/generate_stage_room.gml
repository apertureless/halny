/// @arg room_center_x
/// @arg room_center_y
/// @arg room_radius
function generate_stage_room(argument0, argument1, argument2) {


	var room_center_xg = argument0;
	var room_center_yg = argument1;
	var room_radius = argument2;

	ds_list_add(ROOM_CENTERS, [room_center_xg, room_center_yg]);

	for (var xg = room_center_xg - room_radius; xg <= room_center_xg + room_radius; xg++) {
		for (var yg = room_center_yg + room_radius; yg >= room_center_yg - room_radius; yg--) {
			if (point_distance(xg, yg, room_center_xg, room_center_yg) <= room_radius) {
				set_terrain_at_pos(xg, yg, terrain_type.interior);
			}
		
		}
	}

	var room_xy = grid_to_world(room_center_xg, room_center_yg);
	instance_create(o_ball, room_xy[0], room_xy[1]);


}
