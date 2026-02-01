extends Node

var current_scene = null

func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(-1)

func _process(_delta: float) -> void:
	if Input.is_action_pressed("Escape"):
		exit_to_menu()

# Change to the scene at the given path.
func change_scene(path) -> void:
	_deferred_change_scene.call_deferred(path)

func _deferred_change_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene

func exit_to_menu() -> void:
	if current_scene.name != 'TitleScreen':
		change_scene('res://scenes/title_screen.tscn')

# Exit the game
func exit_game() -> void:
	get_tree().quit()
