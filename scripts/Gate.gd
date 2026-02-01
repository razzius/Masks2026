extends Node
class_name Gate

@export var opened : bool
var closedSprite : Sprite2D
var openSprite : Sprite2D
var sound : AudioStreamPlayer2D
var collider


func _ready() -> void:
	closedSprite = $ClosedSprite2D
	openSprite = $OpenSprite2D
	sound = $AudioStreamPlayer2D
	collider = $StaticBody2D/CollisionShape2D
	
	if(opened):
		OpenDoor()
	else:
		CloseDoor()

func OpenDoor() -> void:
	closedSprite.visible = false
	openSprite.visible = true
	collider.disabled = true
	opened = true
	
func CloseDoor() -> void:
	closedSprite.visible = true
	openSprite.visible = false
	collider.disabled = false
	opened = false
	
func ToggleDoor() -> void:
	if(opened):
		CloseDoor()
	else:
		OpenDoor()
	sound.play()
