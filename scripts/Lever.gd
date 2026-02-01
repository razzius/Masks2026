extends Button

@export var gates : Array[Gate] = []
@export var lights : Array[Spotlight] = []

var animSprite : AnimatedSprite2D
var character : CharacterAnimator
var moving = false
var leverUp = true

func _ready() -> void:
	animSprite = get_parent()
	animSprite.play("idle")
	character = get_tree().get_nodes_in_group("Character")[0]

func _process(delta: float) -> void:
	pass
	
func _pressed() -> void:
	if(!moving):
		moving = true
		
		if character:
			character.PlayThinking()
		else:
			printerr("Character is null")
		
		if(leverUp):
			animSprite.play("slide_down")
			leverUp = false
		else:
			animSprite.play_backwards("slide_down")
			leverUp = true

func ChangeDoors() -> void:
	for gate in gates:
		gate.ToggleDoor()
		
func ChangeLights() -> void:
	for light in lights:
		light.ToggleLight()

func OnAnimationFinished() -> void:
	moving = false
	ChangeDoors()
	ChangeLights()
	if leverUp:
		animSprite.play("idle")
