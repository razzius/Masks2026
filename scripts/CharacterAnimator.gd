extends AnimatedSprite2D
class_name CharacterAnimator
## Possibly add signal when victory ends.

var thinking = false

func _ready() -> void:
	PlayWorried()

func _process(delta: float) -> void:
	pass

func PlayWorried() -> void:
	play("worried")
	
func PlayThinking() -> void:
	if !thinking:
		play("thinking")
		await get_tree().create_timer(3).timeout
		thinking = false
		PlayWorried()
	
func PlayVictory() -> void:
	play("victory")
