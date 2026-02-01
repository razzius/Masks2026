extends Node

var character : CharacterAnimator

var current_scene = null
var current_level = 0
var levels = [
	'res://scenes/Stages/Stage1.tscn',
	'res://scenes/Stages/StageRazzi.tscn',
	'res://scenes/Stages/StageRazziSilly.tscn'
]

func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(-1)

func _process(_delta: float) -> void:
	if Input.is_action_pressed("Escape"):
		exit_to_menu()
		
func check_level_complete() -> void:
	print("Checking level started")
	var masks = get_tree().get_nodes_in_group("Masks")
	if(masks.all(func(element): return element.deleted)):
		complete_level(false)

func complete_level(exit_to_menu: bool) -> void:
	## Todo: Play win animation
	var curtains
	if current_level == 0:
		curtains = current_scene.get_node('CanvasLayer/Curtains')
	else:
		curtains = current_scene.get_node('Curtains')
	if (exit_to_menu):
		current_level = -1
	
	if character:
		character.PlayVictory()
	curtains.animation_finished.connect(advance_level)
	curtains.close()

# Advance to the next level.
func advance_level() -> void:
	if current_level >= 0 && current_level < levels.size():
		change_scene(levels[current_level])
		current_level += 1
	else:
		change_scene('res://scenes/title_screen.tscn')
		current_level = 0

# Change to the scene at the given path.
func change_scene(scene) -> void:
	_deferred_change_scene.call_deferred(scene)

func _deferred_change_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
	var masks = get_tree().get_nodes_in_group("Masks")
	for mask in masks:
		mask.OnMaskMerged.connect(check_level_complete)
		
	if get_tree().get_nodes_in_group("Character"):
		character = get_tree().get_nodes_in_group("Character")[0]
		
func start_scene() -> void:
	pass
	## Connect to mask collision events
	## Open curtains

func exit_to_menu() -> void:
	if current_scene.name != 'TitleScreen':
		complete_level(true)

# Exit the game
func exit_game() -> void:
	var curtains = current_scene.get_node('CanvasLayer/Curtains')
	curtains.animation_finished.connect(quit)
	curtains.close()

func quit() -> void:
	get_tree().quit()
