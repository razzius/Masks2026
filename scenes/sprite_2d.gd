extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_parent().get_parent().is_light:
		texture = load("res://art/sadmask.png")
	else:
		texture = load("res://art/happymask.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
