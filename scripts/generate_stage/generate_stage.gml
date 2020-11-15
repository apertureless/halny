function generate_stage() {
	clear_world_tiles();
	WORLD_LAYER = layer_create(TERRAIN_DEPTH);
	
	ds_map_clear(TERRAIN_TYPES);
	ds_list_clear(ROOM_CENTERS);
	ds_list_clear(TERRAIN_LOCATIONS);

	var number_rooms = irandom_range(5, 10);
	var room_min_radius = 3;
	var room_max_radius = 7;

	var room_xg = 0;
	var room_yg = 0;

	var room_radius = irandom_range(room_min_radius, room_max_radius);
	
	var main_direction = irandom(359);
	var angle_range = 130;

	#region set locations of rooms
	while (ds_list_size(ROOM_CENTERS) < number_rooms) {
		generate_stage_room(room_xg, room_yg, room_radius);
	
		var bridge_length = irandom_range(2, 5);
	
		var new_room_radius = irandom_range(room_min_radius, room_max_radius);
		var new_room_distance = room_radius + new_room_radius + bridge_length;
		var new_room_direction = main_direction + random_range(-angle_range, angle_range);
	
		room_xg = round(lengthdir_x(new_room_distance, new_room_direction));
		room_yg = round(lengthdir_y(new_room_distance, new_room_direction));
		room_radius = new_room_radius;
	
	}
	#endregion

	#region Update Terrain Types
	for (var i = 0; i < ds_list_size(TERRAIN_LOCATIONS); i++) {
		var this_coords = TERRAIN_LOCATIONS[|i];
		var this_xy = coord_to_grid(this_coords);
		var this_yg = this_xy[1];
		var is_edge = false;
	
		for (var xg = this_xy[0]-1; xg <= this_xy[0]+1 && !is_edge; xg++) {
			for (var yg = this_xy[1]-1; yg <= this_xy[1]+1 && !is_edge; yg++) {
				var coord_to_check = grid_to_coord(xg, yg);
			
				if !ds_map_exists(TERRAIN_TYPES, coord_to_check) {
					is_edge = true;
					ds_map_replace(TERRAIN_TYPES, this_coords, terrain_type.edge);
				}
			}
		}
	}
	#endregion

	#region Draw Tiles based on grid data
 
	var spawn_order = ds_priority_create();

	for (var i = 0; i < ds_list_size(TERRAIN_LOCATIONS); i++) {
		var this_coords = TERRAIN_LOCATIONS[|i];
		var this_xy = coord_to_grid(this_coords);
		
		var this_world_xy = grid_to_world(this_xy[0], this_xy[1]);
	
		ds_priority_add(spawn_order, this_coords, this_world_xy[1]);
	}

	while !ds_priority_empty(spawn_order) {
		var this_coords = ds_priority_delete_max(spawn_order);
		var this_xy = coord_to_grid(this_coords);
		var this_sprite = s_grass_tile;
	
		if TERRAIN_TYPES[?this_coords] == terrain_type.edge {
			this_sprite = s_dirt;
		}
		
		var world_xy = grid_to_world(this_xy[0], this_xy[1]);
		
		var sp = layer_sprite_create(
			WORLD_LAYER, 
			world_xy[0]+irandom_range(-2, 2), 
			world_xy[1]+irandom_range(-2, 2), 
			this_sprite
		);
	
		layer_sprite_blend(sp, color_darken(c_white, random_range(.92, 1)));
		ds_list_add(TILES_LIST, sp);
	}

	ds_priority_destroy(spawn_order);
	#endregion


}
