extends Node2D
class_name Mask
signal OnMaskMerged

@export var is_light : bool
@export var minVelocity : float = 180
@export var maxVelocity : float = 360
@export var speedMod : float = 60
@export var mask_scale : float = 1.0

var deleted = false
var merge_sound : AudioStreamPlayer2D
var animSprite : AnimatedSprite2D
var rng : RandomNumberGenerator = RandomNumberGenerator.new()
var audioPlayer : AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if is_light:
		$RigidBody2D.set_collision_mask_value(2, true)
	audioPlayer = $AudioStreamPlayer2D
	#audioPlayer.volume_db
	animSprite = $AnimatedSprite2D
	animSprite.visible = false
	animSprite.animation_finished.connect(DeleteSprite)
	merge_sound = $AudioStreamPlayer2D2
	$RigidBody2D/CollisionPolygon2D.global_scale = Vector2(mask_scale, mask_scale)
	$RigidBody2D/Sprite2D.global_scale = Vector2(mask_scale, mask_scale)
	$AnimatedSprite2D.global_scale = Vector2(mask_scale / 2, mask_scale / 2)

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
				var new_x = ($RigidBody2D.global_position.x + body.global_position.x) / 2
				var new_y = ($RigidBody2D.global_position.y + body.global_position.y) / 2
				var new_position = Vector2(new_x, new_y)
				animSprite.global_position = new_position
				animSprite.visible = true
				animSprite.play("merge")
				merge_sound.play(1.0)
			deleted = true
			body.queue_free()
	audioPlayer.play()
	Bounce()
	if body.get_parent() as Spotlight:
		if not is_light:
			$RigidBody2D.linear_velocity = Vector2(0,0)
