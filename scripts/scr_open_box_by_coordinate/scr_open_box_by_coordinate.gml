function scr_open_box_by_coordinate(field, boxX, boxY, width, height) {
	var leftBordered = boxX == 0;
	var rightBordered = boxX == width - 1;
	var topBordered = boxY == 0;
	var bottomBordered = boxY == height - 1;
	
	var box = scr_get_box_by_coordinate(field, boxX, boxY);
	
	show_debug_message(box);
	
	if (!is_struct(box) || box.open) {
		return;
	}
	
	box.setOpen(true);
	
	if (box.mine) {
		with (obj_minesweeper) {
			event_user(0);
		}
	} else if (box.nearby == 0) {
		if (!leftBordered) {
			scr_open_box_by_coordinate(field, boxX - 1, boxY, width, height);
				
			if (!topBordered) {
				scr_open_box_by_coordinate(field, boxX - 1, boxY - 1, width, height);
			}
				
			if (!bottomBordered) {
				scr_open_box_by_coordinate(field, boxX - 1, boxY + 1, width, height);
			}
		}
			
		if (!rightBordered) {
			scr_open_box_by_coordinate(field, boxX + 1, boxY, width, height);
		
			if (!topBordered) {
				scr_open_box_by_coordinate(field, boxX + 1, boxY - 1, width, height);
			}
		
			if (!bottomBordered) {
				scr_open_box_by_coordinate(field, boxX + 1, boxY + 1, width, height);
			}
		}
	
		if (!topBordered) {
			scr_open_box_by_coordinate(field, boxX, boxY - 1, width, height);
		}
	
		if (!bottomBordered) {
			scr_open_box_by_coordinate(field, boxX, boxY + 1, width, height);
		}
	}
}