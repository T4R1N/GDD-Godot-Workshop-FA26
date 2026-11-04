extends Timer


func _on_timeout() -> void:
	GameManager.add_shovel_score()
