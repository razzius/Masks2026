extends Node2D
class_name Mask
signal OnMaskMerged

@export var is_light : bool
@export var minVelocity : float = 180
@export var maxVelocity : float = 360
@export var speedMod : float = 60

var deleted = false
var animSprite : AnimatedSprite2D
var rng : RandomNumberGenerator = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if is_light:
		$RigidBody2D.set_collision_mask_value(2, true)
	animSprite = $AnimatedSprite2D
	animSprite.visible = false
	animSprite.animation_finished.connect(DeleteSprite)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func Bounce() -> void:
	var rb : RigidBody2D = get_child(0)
	var currentV : Vector2 = rb.linear_velocity
	var xMod = rng.randf_range(-speedMod, speedMod)
	var yMod = rng.randf_range(-speedMod, speedMod)
	
	rb.linear_velocity.x += xMod
	rb.linear_velocity.y += yMod
	
	if rb.linear_velocity.x < 0:
		rb.linear_velocity.x = clampf(rb.linear_velocity.x, -minVelocity, -maxVelocity)
	if rb.linear_velocity.x > 0:
		rb.linear_velocity.x = clampf(rb.linear_velocity.x, minVelocity, maxVelocity)
	if rb.linear_velocity.y < 0:
		rb.linear_velocity.y = clampf(rb.linear_velocity.y, -minVelocity, -maxVelocity)
	if rb.linear_velocity.y > 0:
		rb.linear_velocity.y = clampf(rb.linear_velocity.y, minVelocity, maxVelocity)

func DeleteSprite() -> void:
	queue_free()
	OnMaskMerged.emit()

# Mask collided with something.
func _on_rigid_body_2d_body_entered(body: Node) -> void:
	if body.get_parent() as Mask:
		if body.get_parent().is_light != is_light:			## Merge occured.
			if is_light:
				animSprite.visible = true
				animSprite.play("merge")
			deleted = true
			body.queue_free()
	Bounce()
	if body.get_parent() as Spotlight:
		if not is_light:
			$RigidBody2D.linear_velocity = Vector2(0,0)
