function scr_open_box_by_index(field, index, width, height) {
	var boxX = index % width;
	var boxY = floor(index / width);
	
	scr_open_box_by_coordinate(field, boxX, boxY, width, height);
}