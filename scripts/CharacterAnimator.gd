extends AnimatedSprite2D
class_name CharacterAnimator
## Possibly add signal when victory ends.

var thinking = false

func _ready() -> void:
	self.global_position.x -= 20
	self.global_position.y += 30
	PlayWorried()
	thinking = false

func PlayWorried() -> void:
	self.offset.x = 0
	self.offset.y = 20
	play("worried")
	
func PlayThinking() -> void:
	if !thinking:
		self.offset.x = 53
		self.offset.y = 19
		play("thinking")
		await get_tree().create_timer(3).timeout
		thinking = false
		PlayWorried()
	
func PlayVictory() -> void:
	self.offset.x = 112
	self.offset.y = -70
	play("victory")
