function scr_toggle_flag_box_by_coordinate(field, boxX, boxY, width, height) {
	var box = scr_get_box_by_coordinate(field, boxX, boxY);
		
	if (!is_struct(box) || box.open) {
		return;
	}
	
	box.setFlagged(!box.flagged);
}