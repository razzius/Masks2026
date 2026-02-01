extends Button

@export var gates : Array[Gate] = []

var animSprite : AnimatedSprite2D
var moving = false
var leverUp = true

func _ready() -> void:
	animSprite = get_parent()
	animSprite.play("idle")
	

func _process(delta: float) -> void:
	pass
	
func _pressed() -> void:
	if(!moving):
		moving = true
		ChangeDoors()
		
		if(leverUp):
			animSprite.play("slide_down")
			leverUp = false
		else:
			animSprite.play_backwards("slide_down")
			leverUp = true

func ChangeDoors() -> void:
	for gate in gates:
		gate.ToggleDoor()

func OnAnimationFinished() -> void:
	moving = false
