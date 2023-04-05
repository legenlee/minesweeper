if (dunked == false) {
	dunked = true;

	for (var i = 0; i < mines; i += 1) {
		var index = minePositions[i];
	
		scr_open_box_by_index(field, index, width, height);
	}
}