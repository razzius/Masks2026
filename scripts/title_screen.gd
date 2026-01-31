extends Node2D

func _on_start_button_pressed() -> void:
	GameManager.change_scene('res://scenes/main.tscn')


func _on_quit_button_pressed() -> void:
	GameManager.exit_game()
