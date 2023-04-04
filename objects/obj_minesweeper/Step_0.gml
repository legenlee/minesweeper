if (width != noone && height != noone) {
	if (!dunked) {
		mouseLeftInput = mouse_check_button(mb_left);
		mouseLeftReleased = mouse_check_button_released(mb_left);
	
		if (hoveredBoxX != noone && hoveredBoxY != noone) {
			hoveredBox = ds_grid_get(field, hoveredBoxX, hoveredBoxY);
		}
	
		if (mouseLeftReleased && clickable) {
			hoveredBox.setOpen(true);
		}
	} else {
		mouseLeftInput = 0;
		mouseLeftReleased = 0;
	}
}