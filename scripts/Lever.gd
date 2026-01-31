extends Button

@export var gates : Array[Gate] = []
var moving : bool

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass
	
func _pressed() -> void:
	if(!moving):
		moving = true
		ChangeDoors()
		## Play moving animation.
		moving = false
		

func ChangeDoors() -> void:
	for gate in gates:
		gate.ToggleDoor()
