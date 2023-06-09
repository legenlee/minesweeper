if (width != noone && height != noone) {
	var horizontalCenter = room_width / 2;
	var calculatedTimespan = round(date_second_span(startedAt, current));

	hoveredBoxX = noone;
	hoveredBoxY = noone;	

	draw_set_align(fa_center, fa_middle);
	draw_set_color(COLOR_YELLOW);
	draw_text(horizontalCenter - 64, fieldRectTop - 32, string(mines - flags));
	draw_text(horizontalCenter + 64, fieldRectTop - 32, string(calculatedTimespan));
	
	for (var i = 0; i < width; i += 1) {
		for (var j = 0; j < height; j += 1) {
			var box = ds_grid_get(field, i, j);
			var boxRectTop = fieldRectTop + j * BOX_SIZE + (j - 1) * BOX_SPACING;
			var boxRectBottom = boxRectTop + BOX_SIZE;
			var boxRectLeft = fieldRectLeft + i * BOX_SIZE + (i - 1) * BOX_SPACING;
			var boxRectRight = boxRectLeft + BOX_SIZE;
			
			if (mouse_x >= boxRectLeft - BOX_PADDING && mouse_x <= boxRectRight + BOX_PADDING && mouse_y >= boxRectTop - BOX_PADDING && mouse_y <= boxRectBottom + BOX_PADDING) {
				hoveredBoxX = i;
				hoveredBoxY = j;
			}
			
			var hovered = hoveredBoxX == i && hoveredBoxY == j;
			
			draw_set_align(fa_left, fa_top);
			draw_set_color(COLOR_WHITE);
			draw_rectangle(boxRectLeft, boxRectTop, boxRectRight, boxRectBottom, false);
			
			if (box.open) {
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
			} else {
				if (!clickable || !hovered) {
					draw_set_color(COLOR_GRAY);
				} else if (mouseLeftInput) {
					draw_set_color(COLOR_DARK_GRAY);
				} else {
					draw_set_color(COLOR_LIGHT_GRAY);
				}
				
				draw_rectangle(boxRectLeft + 1, boxRectTop + 1, boxRectRight - 1, boxRectBottom - 1, false);
				
				if (box.flagged) {
					draw_sprite(spr_flag, 0, boxRectLeft, boxRectTop);
				}
			}		
		}
	}
}