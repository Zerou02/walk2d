extends Node2D

@onready var grid: cGOLGrid = $cGOL;
@onready var cells: Dictionary = {};

func _ready():
	var cell = Cell.new(true);
	grid.addOccupiedField(5,5,cell);
	grid.queue_redraw();
	cell.isLiving = false;
	pass # Replace with function body.

func _process(delta):
	pass
