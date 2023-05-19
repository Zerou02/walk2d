extends Node
class_name Cell
var isLiving:bool;
var field: Vector2;

func _init(isLiving:bool):
	self.isLiving = isLiving;
	pass
pass

func _ready():
	pass

func _process(delta):
	pass
	
func setIsLiving(val:bool):
	self.isLiving = val;
pass
