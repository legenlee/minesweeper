if (width != noone && height != noone) {
	if (dunked || completed) {
		mouseLeftInput = 0;
		mouseLeftReleased = 0;
		clickable = false;
	} else {
		current = date_current_datetime();
		
		var hovered = hoveredBoxX != noone && hoveredBoxY != noone
		
		mouseLeftInput = mouse_check_button(mb_left);
		mouseLeftReleased = mouse_check_button_released(mb_left);
		mouseRightReleased = mouse_check_button_released(mb_right);
		clickable = hovered && !ds_grid_get(field, hoveredBoxX, hoveredBoxY).flagged;
	
		if (mouseLeftReleased && clickable) {
			scr_open_box_by_coordinate(field, hoveredBoxX, hoveredBoxY, width, height);
		}
		
		if (mouseRightReleased && hovered) {
			scr_toggle_flag_box_by_coordinate(field, hoveredBoxX, hoveredBoxY, width, height);
		}
		
		if (openedBoxs + mines = size) {
			completed = true;
		}
	}
}