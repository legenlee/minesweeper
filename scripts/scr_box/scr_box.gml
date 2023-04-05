function Box() constructor {
	nearby = 0;
	mine = false;
	open = false;
	flagged = false;
	
	addNearby = function () {
		self.setNearby(self.nearby + 1);
	}
	
	setNearby = function (value) {
		self.nearby = value;
	}
	
	setMine = function (value) {
		self.mine = value;
	}
	
	setOpen = function (value) {
		self.open = value;
	}
	
	setFlagged = function (value) {
		self.flagged = value;
	}
}