enum ManagerState {
	LOADING,
	MAIN,
	PLAYING,
	DUNKED,
	COMPLETED
}

enum MinesweeperPreset {
	BEGINNER = 0,
	INTERMEDIATE = 1,
	EXPERT = 2
}

presets = [
	{
		name: "Begineer",
		width: 9,
		height: 9,
		mines: 10
	},
	{
		name: "Intermediate",
		width: 16,
		height: 16,
		mines: 40
	},
	{
		name: "Expert",
		width: 30,
		height: 16,
		mines: 99
	},
];

state = ManagerState.LOADING;
preset = MinesweeperPreset.BEGINNER;
clickable = false;
minesweeper = noone;
