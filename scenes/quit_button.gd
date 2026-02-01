extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("mouse_entered", self.mouse_entered)
	connect("mouse_exited", self.mouse_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func mouse_entered() -> void:
	icon = load("res://art/quit.png")
	
func mouse_exited() -> void:
	icon = load("res://art/quitclickedon.png")
