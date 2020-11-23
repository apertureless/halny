function generate_stage() {
	clear_world_tiles();
	WORLD_LAYER = layer_create(TERRAIN_DEPTH);
	
	var number_rooms = irandom_range(5, 20);
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
	
		var bridge_length = irandom_range(2, 10);
	
		var new_room_radius = irandom_range(room_min_radius, room_max_radius);
		var new_room_distance = room_radius + new_room_radius + bridge_length;
		var new_room_direction = main_direction + random_range(-angle_range, angle_range);
		
		room_xg = round(room_xg + lengthdir_x(new_room_distance, new_room_direction));
		room_yg = round(room_yg + lengthdir_y(new_room_distance, new_room_direction));
		room_radius = new_room_radius;
	
	}
	#endregion
	
	#region Generate Bridges
	for (var i = 0; i < ds_list_size(ROOM_CENTERS)-1; i++) {
		var this_room_xy = ROOM_CENTERS[|i];
		var next_room_xy = ROOM_CENTERS[|i+1];
		
		generate_stage_bridge(this_room_xy[0], this_room_xy[1], next_room_xy[0], next_room_xy[1]);
	}
	
	#endregion

	#region Update Terrain Types
	for (var i = 0; i < ds_list_size(TERRAIN_LOCATIONS); i++) {
		var this_coords = TERRAIN_LOCATIONS[|i];
		
		//if (TERRAIN_TYPES[?this_coords] == terrain_type.interior) {
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
			
		if !is_edge {
			TERRAIN_TYPES[?this_coords] = terrain_type.interior
		}
		//}
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
		
		switch TERRAIN_TYPES[?this_coords] {
			case terrain_type.edge:
				this_sprite = s_edge;
				break;
			case terrain_type.bridge:
				this_sprite = s_dirt;
				break;
				
		}
	
		
		var world_xy = grid_to_world(this_xy[0], this_xy[1]);
		
		var sp = layer_sprite_create(
			WORLD_LAYER, 
			world_xy[0]+irandom_range(-2, 2), 
			world_xy[1]+irandom_range(-2, 2), 
			this_sprite
		);
	
		layer_sprite_blend(sp, color_darken(c_white, random_range(.92, 1)));
		ds_map_add(TILES_SPAWNED, this_coords, sp);
		ds_list_add(TILES_LIST, sp);
	}

	ds_priority_destroy(spawn_order);
	#endregion

	#region Spawn objects in the world
	var spawn_chances = 0;
	spawn_chances[terrain_type.interior] = .05;
	spawn_chances[terrain_type.edge] = .3;
	spawn_chances[terrain_type.bridge] = 0;
	
	for (var i = 0; i < ds_list_size(TERRAIN_LOCATIONS); i++) {
		var this_terrain_coords = TERRAIN_LOCATIONS[|i];
		var this_terrain_type = TERRAIN_TYPES[?this_terrain_coords];
		var this_spawn_chance = spawn_chances[this_terrain_type];
		
		if (random(1) <= this_spawn_chance) {
			var world_position = coord_to_world(this_terrain_coords)
			instance_create(o_shroom, world_position[0], world_position[1])
		}
	}
	
 	#endregion

}
