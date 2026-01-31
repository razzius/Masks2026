extends Node
class_name Gate

signal hit(test: String)

@export var opened : bool
var sprite : Sprite2D
var collider


func _ready() -> void:
	sprite = get_child(0)
	collider = $Area2D/CollisionShape2D
	
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


func _on_area_2d_area_entered(area: Area2D) -> void:
	print('area entered!')
	hit.emit('blah')
