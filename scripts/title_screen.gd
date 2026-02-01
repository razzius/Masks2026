extends Node2D

func _on_start_button_pressed() -> void:
	GameManager.complete_level(false)


func _on_quit_button_pressed() -> void:
	GameManager.exit_game()
