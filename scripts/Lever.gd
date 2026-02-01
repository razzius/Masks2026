extends Button

@export var gates : Array[Gate] = []
var spriteFrames : SpriteFrames

var moving = false
var leverUp = true

func _ready() -> void:
	spriteFrames = get_parent().sprite_frames

func _process(delta: float) -> void:
	pass
	
func _pressed() -> void:
	if(!moving):
		moving = true
		ChangeDoors()
		
		if(leverUp):
			get_parent().play("slide_down")
			leverUp = false
		else:
			get_parent().play_backwards("slide_down")
			leverUp = true
		
		moving = false
		

func ChangeDoors() -> void:
	for gate in gates:
		gate.ToggleDoor()
