extends Button


func _on_pressed() -> void:
	SaveGame.delete_save()
	get_tree().quit()
