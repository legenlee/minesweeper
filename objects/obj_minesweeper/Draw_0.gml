if (width != noone && height != noone) {
	var horizontalCenter = room_width / 2;
	var verticalCenter = room_height / 2;
	
	var fieldWidth = BOX_SIZE * width + BOX_SPACING * (width - 1);
	var fieldHeight = BOX_SIZE * height + BOX_SPACING * (height - 1);
	
	var rectTop = verticalCenter - fieldHeight / 2;
	var rectBottom = verticalCenter + fieldHeight / 2;
	var rectLeft = horizontalCenter - fieldWidth / 2;
	var rectRight = horizontalCenter + fieldWidth / 2;

	draw_set_align(fa_center, fa_middle);
	
	for (var i = 0; i < width; i += 1) {
		for (var j = 0; j < height; j += 1) {
			var boxRectTop = rectTop + j * BOX_SIZE + (j - 1) * BOX_SPACING;
			var boxRectBottom = boxRectTop + BOX_SIZE;
			var boxRectLeft = rectLeft + i * BOX_SIZE + (i - 1) * BOX_SPACING;
			var boxRectRight = boxRectLeft + BOX_SIZE;
			
			if (mouse_x >= boxRectLeft - BOX_PADDING && mouse_x <= boxRectRight + BOX_PADDING && mouse_y >= boxRectTop - BOX_PADDING && mouse_y <= boxRectBottom + BOX_PADDING) {
				hoveredBoxX = i;
				hoveredBoxY = j;
			} else {
				hoveredBoxX = noone;
				hoveredBoxY = noone;
			}
			
			var hovered = hoveredBoxX == i && hoveredBoxY == j;
			
			draw_set_align(fa_left, fa_top);
			draw_set_color(COLOR_WHITE);
			draw_rectangle(boxRectLeft, boxRectTop, boxRectRight, boxRectBottom, false);
			
			if (dunked || !hovered) {
				draw_set_color(COLOR_GRAY);
			} else if (mouse_check_button(mb_left)) {
				draw_set_color(COLOR_DARK_GRAY);
			} else {
				draw_set_color(COLOR_WHITE_GRAY);
			}
			
			draw_rectangle(boxRectLeft + 1, boxRectTop + 1, boxRectRight - 1, boxRectBottom - 1, false);
		}
	}
}