function Box() constructor {
	nearby = 0;
	mine = false;
	
	static setNearby = function (_box, value) {
		_box.nearby = value;
	}
	
	static addNearby = function (_box) {
		_box.nearby += value;
	}
	
	static setMine = function (_box, value) {
		_box.mine = value;
	}
}

function scr_createMinesweeper(width, height, mines) {
	var size = width * height;
	var field = ds_grid_create(width, height);
	var simulated = ds_list_create();
	var minePositions = [];
	
	for (var i = 0; i < size; i += 1) {
		var widthPosition = i % height;
		var heightPosition = floor(i / height);
		
		ds_grid_set(field, widthPosition, heightPosition, new Box());
		ds_list_add(simulated, i);
	}
	
	ds_list_shuffle(simulated);
	
	for (var i = 0; i < size; i += 1) {
		var widthPosition = i % height;
		var heightPosition = floor(i / height);
		
		if (ds_list_find_value(simulated, i) < mines) {
			array_push(minePositions, i);
			
			var box = ds_grid_get(field, widthPosition, heightPosition);
			Box.setMine(box, true);
		}
	}
	
	show_debug_message(minePositions);
	
	with (instance_create_layer(0, 0, "Instances", obj_minesweeper)) {
		self.width = width;
		self.height = height;
		self.mines = mines;
		self.size = size;
		self.field = field;
	};
}