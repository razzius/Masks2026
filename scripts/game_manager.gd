extends Node

var current_scene = null

func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(-1)

# Change to the scene at the given path.
func change_scene(path) -> void:
	_deferred_change_scene.call_deferred(path)

func _deferred_change_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene

# Exit the game
func exit_game() -> void:
	get_tree().quit()
