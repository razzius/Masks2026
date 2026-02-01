extends Node2D
class_name Mask
signal OnMaskMerged

@export var is_light : bool
var deleted = false
var animSprite : AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animSprite = $AnimatedSprite2D
	animSprite.visible = false
	animSprite.animation_finished.connect(DeleteSprite)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func DeleteSprite() -> void:
	#deleted = true
	#body.queue_free()
	queue_free()
	OnMaskMerged.emit()

# Mask collided with something.
func _on_rigid_body_2d_body_entered(body: Node) -> void:
	if body.get_parent() as Spotlight:
		if not is_light:
			$RigidBody2D.linear_velocity = Vector2(0,0)
	if body.get_parent() as Mask:
		if body.get_parent().is_light != is_light:			## Merge occured.
			if is_light:
				animSprite.visible = true
				animSprite.play("merge")
			deleted = true
			body.queue_free()
			#queue_free()
			#OnMaskMerged.emit()
