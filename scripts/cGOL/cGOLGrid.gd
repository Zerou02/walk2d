extends Node2D
class_name cGOLGrid

@export var gridSize: int = 128;
@export var cellSize: int = 10;
@export var radius: int = 64;

@onready var occupiedFields:Dictionary = {};
# Called when the node enters the scene tree for the first time.
func _ready():
	queue_redraw()
	pass # Replace with function body.

func _process(delta):
	queue_redraw();
	pass

func paintRect(rect: Vector2, colour: Color):
	var dRect = Rect2(rect.x*cellSize,rect.y*cellSize,cellSize,cellSize);
	draw_rect(dRect,colour);
pass

#spaltet den String-Key und gibt Vec zurück
func getPosInVecFromOccField(key: String) -> Vector2:
	var splitted = key.split(",");
	return Vector2(int(splitted[0]),int(splitted[1]));
pass

func addOccupiedField(x:int,y:int,cell: Cell):
	var key = "%s,%s" %[x,y];
	occupiedFields[key] = cell;
	pass
	queue_redraw()
pass

func _draw():
	for x in range(0, gridSize*cellSize + cellSize, cellSize):
		draw_line(Vector2(x,0),Vector2(x,gridSize*cellSize),Color.WEB_GRAY)
	pass
	for y in range(0, gridSize*cellSize + cellSize, cellSize):
		draw_line(Vector2(0,y),Vector2(gridSize*cellSize,y),Color.WEB_GRAY)
	pass
	for pos in self.occupiedFields:
		if occupiedFields[pos]:
			var cell:Cell = occupiedFields[pos];
			var cellTile = getPosInVecFromOccField(pos);
			if cell.isLiving:
				paintRect(cellTile,Color.WEB_GREEN);
			else:
				paintRect(cellTile,Color.WEB_MAROON);
			pass
		pass
	pass
pass

func _input(event):
	if event is InputEventMouseButton:
		print(event);
pass
