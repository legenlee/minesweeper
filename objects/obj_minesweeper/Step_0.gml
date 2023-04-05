if (width != noone && height != noone) {
	if (!dunked) {
		mouseLeftInput = mouse_check_button(mb_left);
		mouseLeftReleased = mouse_check_button_released(mb_left);
	
		if (mouseLeftReleased && clickable) {
			scr_open_box_by_coordinate(field, hoveredBoxX, hoveredBoxY, width, height);
		}
	} else {
		mouseLeftInput = 0;
		mouseLeftReleased = 0;
	}
}