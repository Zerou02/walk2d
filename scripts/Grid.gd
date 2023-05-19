extends Node2D
class_name Grid

@export var gridSize: int = 128;
@export var cellSize: int = 5;
@export var radius: int = 64;

var middleRect: Vector2;
var occupiedFields:Dictionary;
var pPos: Vector2;
var end;
func _ready():
	middleRect = Vector2(int(gridSize/2),int(gridSize/2));
	occupiedFields = {};
	end = false;
	queue_redraw();
	addOccupiedField(middleRect.x,middleRect.y);
pass

func _process(delta):
	pass
pass

func _draw():
		for x in range(0, gridSize*cellSize + cellSize, cellSize):
			draw_line(Vector2(x,0),Vector2(x,gridSize*cellSize),Color.WEB_GRAY)
		pass
		for y in range(0, gridSize*cellSize + cellSize, cellSize):
			draw_line(Vector2(0,y),Vector2(gridSize*cellSize,y),Color.WEB_GRAY)
		pass
		draw_arc(middleRect*cellSize + Vector2(cellSize/2,cellSize/2),cellSize/2 + ((radius-1)*cellSize),0,360,100,Color.WHITE)
		drawDendrite();
		drawPlayer(pPos)
pass

func drawDendrite():
	for s in occupiedFields.keys():
		var numbers = s.split(",");
		var x = int(numbers[0]);
		var y = int(numbers[1]);
		paintRect(Vector2(x,y));
	pass
pass

func paintRect(rect: Vector2):
	var dRect = Rect2(rect.x*cellSize,rect.y*cellSize,cellSize,cellSize);
	draw_rect(dRect,Color.WEB_GREEN);
pass

func addOccupiedField(x:int,y:int):
	var key = "%s,%s" %[x,y];
	occupiedFields[key] = 1;
	pass
	queue_redraw()
pass

func drawPlayer(rect:Vector2):
	draw_circle(rect*cellSize + Vector2(cellSize/2,cellSize/2),cellSize/2,Color.WHITE);
pass
