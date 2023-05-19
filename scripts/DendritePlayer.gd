extends Node2D
class_name DendritePlayer

@onready var pos: Vector2 = Vector2(0,0);

var grid: Grid;
func _init(grid: Grid):
	self.grid = grid;
pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func move() -> void:
	var nr = randi_range(0,3);
	if(nr == 0):
		pos.y -= 1;
	elif (nr == 1):
		pos.x += 1;
	elif (nr == 2):
		pos.y += 1;
	elif (nr == 3):
		pos.x -= 1;
	pass
pass

func spawnPlayer():
	var x = 0;
	var y = 0;
	var tries = 0
	while((!isInsideGrid() || isNextToDendrite())):
		x = randi_range(0,grid.gridSize);
		y = randi_range(0,grid.gridSize);
		tries += 1;
		if(tries> 1_000):
			break;
	pass
	pos = Vector2(x,y);
pass

func isInsideGrid() -> bool:
	var pX = pos.x * grid.cellSize;
	var pY = pos.y * grid.cellSize;
	var x = abs(grid.radius*grid.cellSize - pX);
	var y = abs(grid.radius*grid.cellSize - pY);
	var dist = sqrt(pow(x,2)+pow(y,2));
	var retVal = dist<grid.radius*grid.cellSize;
	return retVal;
	pass
pass

func isNextToDendrite() -> bool:
	var pPos = self.pos;
	var up =    grid.occupiedFields.has("%s,%s"%[pPos.x,pPos.y-1]);
	var right = grid.occupiedFields.has("%s,%s"%[pPos.x-1,pPos.y]);
	var down =  grid.occupiedFields.has("%s,%s"%[pPos.x,pPos.y+1]);
	var left =  grid.occupiedFields.has("%s,%s"%[pPos.x+1,pPos.y]);

	return (up||right||down||left);
	pass
pass
