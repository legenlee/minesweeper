#region General Settings
	#macro WINDOW_TITLE "Minesweeper"

	#macro SCREEN_WIDTH 1280
	#macro SCREEN_HEIGHT 720
	
	#macro COLOR_WHITE make_color_rgb(255, 255, 255)
	#macro COLOR_LIGHT_GRAY make_color_rgb(240, 240, 240)
	#macro COLOR_GRAY make_color_rgb(224, 224, 224)
	#macro COLOR_DARK_GRAY make_color_rgb(192, 192, 192)
	#macro COLOR_DARKIST_GRAY make_color_rgb(128, 128, 128)
	#macro COLOR_BLACK make_color_rgb(0, 0, 0)
	
	#macro COLOR_YELLOW make_color_rgb(255, 255, 0)
	#macro COLOR_BLUE make_color_rgb(0, 0, 220)
	#macro COLOR_GREEN make_color_rgb(0, 220, 0)
	#macro COLOR_RED make_color_rgb(220, 0, 0)
	#macro COLOR_LIGHT_BLUE make_color_rgb(0, 128, 248)
	#macro COLOR_BROWN make_color_rgb(217, 185, 155)
	#macro COLOR_CYAN make_color_rgb(0, 255, 255)
	
	#macro FONT_HEADER fnt_header
	#macro FONT_DEFAULT fnt_default
	#macro FONT_MINE_LABEL fnt_mine_label
	
	#macro TEXT_BUTTON_PADDING 24
	
	#macro GAMEOVER_TITLE "well, seems like you've been dunked on."
	#macro GAMEOVER_LABEL "anyway, click any mouse button makes game reset."
#endregion

#region Gamefield Settings
	#macro BOX_SIZE 24
	#macro BOX_SPACING 2
	#macro BOX_PADDING BOX_SPACING / 2
#endregion