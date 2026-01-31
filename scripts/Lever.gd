extends Node

@export var gates = []

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func ChangeDoors() -> void:
	for gate in gates:
		gate.ToggleDoor()
