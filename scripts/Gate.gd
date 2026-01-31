extends Node

var opened

func _ready() -> void:
	if(opened):
		pass
	else:
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func ToggleDoor() -> void:
	opened = !opened
