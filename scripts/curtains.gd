extends AnimatedSprite2D

func _ready() -> void:
	open()

func open() -> void:
	self.play('open')

func close() -> void:
	self.play('close')
