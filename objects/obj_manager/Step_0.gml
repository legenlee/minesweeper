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
			minesweeper = scr_create_minesweeper(selectedPreset.width, selectedPreset.height, selectedPreset.mines);
			
			state = ManagerState.PLAYING;
		}
	
		break;
	}
	
	case ManagerState.PLAYING: {
		if (minesweeper != noone) {
			if (minesweeper.dunked) {
				state = ManagerState.DUNKED;
			} else if (minesweeper.completed) {
				state = ManagerState.COMPLETED;
			}
		}
		
		break;
	}
	
	case ManagerState.DUNKED:
	case ManagerState.COMPLETED: {
		if (mouse_check_button_released(mb_any)) {
			game_restart();
		}
		
		break;
	}
}