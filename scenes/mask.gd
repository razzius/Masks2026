extends Node2D
class_name Mask

@export var is_light : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Mask collided with something.
func _on_rigid_body_2d_body_entered(body: Node) -> void:
	if body.get_parent() as Mask:
		if body.get_parent().is_light != is_light:
			print('coMBIINEINE')
		#if body.is_light && not is_light:
			#print("COMBINE!")
	#$RigidBody2D.linear_velocity.x = -$RigidBody2D.linear_velocity.x
	pass
