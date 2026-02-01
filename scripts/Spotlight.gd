extends Node
class_name Spotlight

var active
var spun
var occluder

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	active = true
	spun = false
	occluder = $LightOccluder2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func TurnLight() -> void:
	spun = not spun
	var rotation_angle
	if spun:
		rotation_angle = PI / 4
	else:
		rotation_angle = -PI / 4
	$LightOccluder2D.rotate(rotation_angle)

func ToggleLight() -> void:
	active = not active
	$PointLight2D.enabled = active
	$StaticBody2D/CollisionPolygon2D.set_deferred("disabled", not active)
	$StaticBody2D2/CollisionShape2D2.set_deferred("disabled", not active)
