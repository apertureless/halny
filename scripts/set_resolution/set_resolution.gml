

function set_resolution(){
	var aspect_dynamic = 0;
	var aspect_iphone_x = 1;
	var aspect_ipad = 2;
	var aspect_ultrawide = 3;
	
	var aspect_ratios = 0;

	aspect_ratios[aspect_dynamic] = 0;
	aspect_ratios[aspect_iphone_x] = 2.15;
	aspect_ratios[aspect_ipad] = 1.33;
	aspect_ratios[aspect_ultrawide] = 3;
	
	var aspect_ratio_test = aspect_dynamic;
	
	var resolution_min_width = 1920;
	var resolution_min_height = 1080;
	
	var base_wh = resolution_min_width / resolution_min_height;
	
    // Display width and height
	var dw = display_get_width();
	var dh = display_get_height();
	
	// Current Width/Height
	var current_wh = dw / dh;
	
	if (aspect_ratio_test != aspect_dynamic) {
		current_wh = aspect_ratios[aspect_ratio_test];
	}
	
	var resolution_width = resolution_min_width;
	var resolution_height = resolution_min_height;
	
	if (current_wh > base_wh) {
		// Long device
		// Need to expand the width of the view
		resolution_width = (resolution_min_height * current_wh);
	} else if (current_wh < base_wh) {
		// Tall device
		// Need to expand the height of the view
		resolution_height = (resolution_min_width / current_wh);
	}
	
	
	var viewsize_multiplier = min(0.9 * (dw / resolution_width), 0.9* (dh / resolution_height), 1);
	
	for (var r_id = 0; r_id <= room_last; r_id++) {
		if (room_exists(r_id)) {
			var view_index = 0;
			var this_room_camera = room_get_camera(r_id, view_index);
			camera_destroy(this_room_camera);
			
			var new_camera = camera_create_view(0, 0, resolution_width, resolution_height);
			room_set_camera(r_id, view_index, new_camera);
			room_set_viewport(r_id, view_index, true, 0, 0, resolution_width, resolution_height);
		}
	}
	
	surface_resize(application_surface, resolution_width, resolution_height);
	display_set_gui_size(resolution_width, resolution_height);
	window_set_size(resolution_width * viewsize_multiplier, resolution_height * viewsize_multiplier);
	
}