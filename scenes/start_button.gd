extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func mouse_shape_entered() -> void:
	print("over")
	get_parent().get_parent().icon = load("res://art/start.png")
	
func mouse_shape_exited() -> void:
	print("out")
	get_parent().get_parent().icon = load("res://art/startclickedon.png")
