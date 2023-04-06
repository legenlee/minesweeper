function draw_set_align(halign, valign) {
	draw_set_halign(halign);
	draw_set_valign(valign);
}

function draw_text_outlined(xPos, yPos, str, textColor, outlineColor, outlineThickness = 4, outlineQuality = 16) {
	for (var i = 0; i < 360; i += (360 / outlineQuality)) {
		draw_text_color(xPos + lengthdir_x(outlineThickness, i), yPos + lengthdir_y(outlineThickness, i), str, outlineColor, outlineColor, outlineColor, outlineColor, 1);
	}
	
	draw_text_color(xPos, yPos, str, textColor, textColor, textColor, textColor, 1);
}