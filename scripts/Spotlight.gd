extends Node
class_name Spotlight

var active
var occluder

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	active = true
	occluder = $LightOccluder2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func ToggleLight() -> void:
	active = not active
	$PointLight2D.enabled = active
	$StaticBody2D/CollisionPolygon2D.set_deferred("disabled", not active)
	$StaticBody2D2/CollisionShape2D2.set_deferred("disabled", not active)
