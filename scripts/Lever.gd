extends Button

@export var gates : Array[Gate] = []
@export var spriteFrames : SpriteFrames

var moving : bool

func _ready() -> void:
	spriteFrames = get_parent().sprite_frames

func _process(delta: float) -> void:
	pass
	
func _pressed() -> void:
	if(!moving):
		moving = true
		ChangeDoors()
		## Play moving animation.
		spriteFrames.set_animation_loop("slide_down", false)
		moving = false
		

func ChangeDoors() -> void:
	for gate in gates:
		gate.ToggleDoor()
