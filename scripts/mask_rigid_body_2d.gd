extends RigidBody2D

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var speed = state.linear_velocity.length()
	#print('speed: ' + str(speed))
