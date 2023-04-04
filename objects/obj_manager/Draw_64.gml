var horizontalCenter = display_get_gui_width() / 2;
var verticalCenter = display_get_gui_height() / 2;

draw_set_align(fa_center, fa_middle);

switch (state) {
	case ManagerState.LOADING: {
		draw_set_color(COLOR_WHITE);
		draw_set_font(FONT_DEFAULT);
		draw_text(horizontalCenter, verticalCenter, "Loading...");
		break;
	}
	
	case ManagerState.MAIN: {
		draw_set_color(COLOR_WHITE);
		draw_set_font(FONT_HEADER);
		draw_text(horizontalCenter, 100, "this is what you want. minesweeper.");

		draw_set_font(FONT_DEFAULT);
		draw_text(horizontalCenter, verticalCenter - 16, "select a difficulty you wanna play, dude.");
		
		var presetCount = array_length(presets);
		
		clickable = false;
		
		for (var i = 0; i < presetCount; i += 1) {
			var horizontalOffset = (i - 1) * 180;
			
			var label = presets[i].name;
			var labelWidth = string_width(label);
			var labelHeight = string_height(label);			
			var labelHorizontalPosition = horizontalCenter + horizontalOffset;
			var labelVerticalPosition = verticalCenter + 16;

			var rectTop = labelVerticalPosition - TEXT_BUTTON_PADDING - labelHeight / 2;
			var rectBottom = labelVerticalPosition + TEXT_BUTTON_PADDING + labelHeight / 2;
			var rectLeft = labelHorizontalPosition - TEXT_BUTTON_PADDING - labelWidth / 2;
			var rectRight = labelHorizontalPosition + TEXT_BUTTON_PADDING + labelWidth / 2;
			
			if (mouse_x >= rectLeft && mouse_x <= rectRight && mouse_y >= rectTop && mouse_y <= rectBottom) {
				clickable = true;
				
				if (i != preset) {
					preset = i;
				}
			}
			
			draw_set_color(i == preset ? COLOR_YELLOW : COLOR_WHITE);
			draw_text(labelHorizontalPosition, labelVerticalPosition, label);
		}
		
		break;
	}
}