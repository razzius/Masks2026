extends Node

var occluder

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	occluder = $LightOccluder2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	occluder.rotation += 0.01
	if occluder.rotation >= 180:
		occluder.rotation = 0.0
	pass
