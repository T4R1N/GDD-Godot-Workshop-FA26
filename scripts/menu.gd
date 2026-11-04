extends Control

signal menu_start


func _on_start_button_pressed() -> void:
	menu_start.emit()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
