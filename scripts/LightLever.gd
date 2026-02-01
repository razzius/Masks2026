extends Button

var light : Spotlight

var animSprite : AnimatedSprite2D
var character : CharacterAnimator
var moving = false
var leverUp = true

func _ready() -> void:
	animSprite = get_parent()
	animSprite.play("idle")
	character = get_tree().get_nodes_in_group("Character")[0]
	light = get_tree().get_nodes_in_group("Lights")[0] as Spotlight

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

func ChangeLights() -> void:
	light.ToggleLight()

func OnAnimationFinished() -> void:
	print("done")
	moving = false
	ChangeLights()
	if leverUp:
		animSprite.play("idle")
