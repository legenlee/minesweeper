if (width != noone && height != noone) {
	var horizontalCenter = room_width / 2;
	var verticalCenter = room_height / 2;
	
	var fieldWidth = BOX_SIZE * width + BOX_SPACING * (width - 1);
	var fieldHeight = BOX_SIZE * height + BOX_SPACING * (height - 1);
	
	var rectTop = verticalCenter - fieldHeight / 2;
	var rectBottom = verticalCenter + fieldHeight / 2;
	var rectLeft = horizontalCenter - fieldWidth / 2;
	var rectRight = horizontalCenter + fieldWidth / 2;
	
	hoveredBoxX = noone;
	hoveredBoxY = noone;
	clickable = mouse_x >= rectLeft && mouse_x <= rectRight && mouse_y >= rectTop && mouse_y <= rectBottom;

	draw_set_align(fa_center, fa_middle);
	
	for (var i = 0; i < width; i += 1) {
		for (var j = 0; j < height; j += 1) {
			var box = ds_grid_get(field, i, j);
			var boxRectTop = rectTop + j * BOX_SIZE + (j - 1) * BOX_SPACING;
			var boxRectBottom = boxRectTop + BOX_SIZE;
			var boxRectLeft = rectLeft + i * BOX_SIZE + (i - 1) * BOX_SPACING;
			var boxRectRight = boxRectLeft + BOX_SIZE;
			
			if (mouse_x >= boxRectLeft - BOX_PADDING && mouse_x <= boxRectRight + BOX_PADDING && mouse_y >= boxRectTop - BOX_PADDING && mouse_y <= boxRectBottom + BOX_PADDING) {
				hoveredBoxX = i;
				hoveredBoxY = j;
			}
			
			var hovered = hoveredBoxX == i && hoveredBoxY == j;
			
			draw_set_align(fa_left, fa_top);
			draw_set_color(COLOR_WHITE);
			draw_rectangle(boxRectLeft, boxRectTop, boxRectRight, boxRectBottom, false);
			
			//if (box.open) {
			//	if (dunked || !hovered) {
			//		draw_set_color(COLOR_GRAY);
			//	} else if (mouseLeftInput) {
			//		draw_set_color(COLOR_DARK_GRAY);
			//	} else {
			//		draw_set_color(COLOR_LIGHT_GRAY);
			//	}
				
			//	draw_rectangle(boxRectLeft + 1, boxRectTop + 1, boxRectRight - 1, boxRectBottom - 1, false);
			//} else {
				draw_set_color(COLOR_BLACK);
				draw_rectangle(boxRectLeft + 1, boxRectTop + 1, boxRectRight - 1, boxRectBottom - 1, false);
				
				if (!box.mine) {
					var color = COLOR_WHITE;
					
					switch (box.nearby) {
						case 1: {
							color = COLOR_BLUE;
							break;
						}
					
						case 2: {
							color = COLOR_GREEN;
							break;
						}
					
						case 3: {
							color = COLOR_RED;
							break;
						}
					
						case 4: {
							color = COLOR_LIGHT_BLUE;
							break;
						}
					
						case 5: {
							color = COLOR_BROWN;
							break;
						}
					
						case 6: {
							color = COLOR_CYAN;
							break;
						}
					
						case 7: {
							color = COLOR_WHITE;
							break;
						}
					
						case 8: {
							color = COLOR_GRAY;
							break;
						}
					}
				
					draw_sprite_ext(spr_number, box.nearby, boxRectLeft, boxRectTop, 1, 1, 0, color, 1);
				} else {
					draw_sprite(spr_mine, 0, boxRectLeft, boxRectTop);
				}
			//}		
		}
	}
}