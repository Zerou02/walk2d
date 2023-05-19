extends Node2D

var player: DendritePlayer;
var grid: Grid;
func _ready():
	self.grid = Grid.new();
	self.player = DendritePlayer.new(grid);
	self.add_child(grid);
	self.add_child(player)
	pass
pass

func _process(delta):
	for x in range(0,100):
		player.move();
		if(!player.isInsideGrid()):
			player.spawnPlayer();
		if(player.isNextToDendrite()):
			grid.addOccupiedField(player.pos.x,player.pos.y);
		pass
		grid.queue_redraw()
	pass
	$Label.text = str("FPS: %s"%Engine.get_frames_per_second());
pass
