extends Node

@export var opened : bool
var sprite : Sprite2D
var collider : Area2D


func _ready() -> void:
	sprite = get_child(0)
	collider = get_child(1)
	
	if(opened):
		OpenDoor()
	else:
		CloseDoor()

func _process(delta: float) -> void:
	pass

func OpenDoor() -> void:
	sprite.visible = false
	collider.disabled = true
	opened = true
	
func CloseDoor() -> void:
	sprite.visible = true
	collider.disabled = false
	opened = false
	
func ToggleDoor() -> void:
	if(opened):
		CloseDoor()
	else:
		OpenDoor()
