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
			var box = ds_grid_get(field, widthPosition, heightPosition);

			array_push(minePositions, i);			
			box.setMine(true);
			
			if (!leftBordered) {
				var leftBox = ds_grid_get(field, widthPosition - 1, heightPosition);
				leftBox.addNearby();
				
				if (!topBordered) {
					var leftTopBox = ds_grid_get(field, widthPosition - 1, heightPosition - 1);
					leftTopBox.addNearby();
				}
				
				if (!bottomBordered) {
					var leftBottomBox = ds_grid_get(field, widthPosition - 1, heightPosition + 1);
					leftBottomBox.addNearby();
				}
			}
			
			if (!rightBordered) {
				var rightBox = ds_grid_get(field, widthPosition + 1, heightPosition);
				rightBox.addNearby();
				
				if (!topBordered) {
					var rightTopBox = ds_grid_get(field, widthPosition + 1, heightPosition - 1);
					rightTopBox.addNearby();
				}
				
				if (!bottomBordered) {
					var rightBottomBox = ds_grid_get(field, widthPosition + 1, heightPosition + 1);
					rightBottomBox.addNearby();
				}
			}
			
			if (!topBordered) {
				var topBox = ds_grid_get(field, widthPosition, heightPosition - 1);
				topBox.addNearby();
			}
			
			if (!bottomBordered) {
				var bottomBox = ds_grid_get(field, widthPosition, heightPosition + 1);
				bottomBox.addNearby();
			}
		}
	}
	
	with (instance_create_layer(0, 0, "Instances", obj_minesweeper)) {
		self.width = width;
		self.height = height;
		self.mines = mines;
		self.size = size;
		self.field = field;
	};
}