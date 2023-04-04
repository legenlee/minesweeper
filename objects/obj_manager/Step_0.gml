switch (state) {
	case ManagerState.LOADING: {
		display_set_gui_size(SCREEN_WIDTH, SCREEN_HEIGHT);
		room_set_size(room, SCREEN_WIDTH, SCREEN_HEIGHT);
		window_set_caption(WINDOW_TITLE);
		
		state = ManagerState.MAIN;
		break;
	}
	
	case ManagerState.MAIN: {
		if (clickable == true && mouse_check_button_released(mb_left)) {
			var selectedPreset = presets[preset];
			
			with (instance_create_layer(0, 0, "Instances", obj_minesweeper)) {
				width = selectedPreset.width;
				height = selectedPreset.height;
				mines = selectedPreset.mines;
			}
			
			state = ManagerState.PLAYING;
		}
	
		break;
	}
}