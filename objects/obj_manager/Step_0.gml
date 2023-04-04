switch (state) {
	case ManagerState.LOADING: {
		display_set_gui_size(SCREEN_WIDTH, SCREEN_HEIGHT);
		room_set_size(room, SCREEN_WIDTH, SCREEN_HEIGHT);
		window_set_caption(WINDOW_TITLE);
		
		state = ManagerState.MAIN;
		break;
	}
	
	case ManagerState.MAIN: {
		
	
		break;
	}
}