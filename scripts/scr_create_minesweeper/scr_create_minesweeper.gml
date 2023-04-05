function scr_create_minesweeper(width, height, mines) {
	var size = width * height;
	var field = ds_grid_create(width, height);
	var simulated = ds_list_create();
	var minePositions = [];
	
	for (var i = 0; i < size; i += 1) {
		var widthPosition = i % width;
		var heightPosition = floor(i / width);
		
		ds_grid_set(field, widthPosition, heightPosition, new Box());
		ds_list_add(simulated, i);
	}
	
	ds_list_shuffle(simulated);
	
	for (var i = 0; i < size; i += 1) {
		var widthPosition = i % width;
		var heightPosition = floor(i / width);
		
		if (ds_list_find_value(simulated, i) < mines) {
			var leftBordered = widthPosition == 0;
			var rightBordered = widthPosition == width - 1;
			var topBordered = heightPosition == 0;
			var bottomBordered = heightPosition == height - 1;
			var box = scr_get_box_by_coordinate(field, widthPosition, heightPosition);

			array_push(minePositions, i);			
			box.setMine(true);
			
			if (!leftBordered) {
				var leftBox = scr_get_box_by_coordinate(field, widthPosition - 1, heightPosition);
				leftBox.addNearby();
				
				if (!topBordered) {
					var leftTopBox = scr_get_box_by_coordinate(field, widthPosition - 1, heightPosition - 1);
					leftTopBox.addNearby();
				}
				
				if (!bottomBordered) {
					var leftBottomBox = scr_get_box_by_coordinate(field, widthPosition - 1, heightPosition + 1);
					leftBottomBox.addNearby();
				}
			}
			
			if (!rightBordered) {
				var rightBox = scr_get_box_by_coordinate(field, widthPosition + 1, heightPosition);
				rightBox.addNearby();
				
				if (!topBordered) {
					var rightTopBox = scr_get_box_by_coordinate(field, widthPosition + 1, heightPosition - 1);
					rightTopBox.addNearby();
				}
				
				if (!bottomBordered) {
					var rightBottomBox = scr_get_box_by_coordinate(field, widthPosition + 1, heightPosition + 1);
					rightBottomBox.addNearby();
				}
			}
			
			if (!topBordered) {
				var topBox = scr_get_box_by_coordinate(field, widthPosition, heightPosition - 1);
				topBox.addNearby();
			}
			
			if (!bottomBordered) {
				var bottomBox = scr_get_box_by_coordinate(field, widthPosition, heightPosition + 1);
				bottomBox.addNearby();
			}
		}
	}
	
	var minesweeper = instance_create_layer(0, 0, "Instances", obj_minesweeper);
	
	with (minesweeper) {
		self.width = width;
		self.height = height;
		self.mines = mines;
		self.size = size;
		self.field = field;
		self.minePositions = minePositions;
		self.flagPositions = ds_list_create();
	};
	
	return minesweeper;
}