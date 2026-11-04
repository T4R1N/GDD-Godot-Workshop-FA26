extends Button

@export var score_on_click: int = 1

func _ready() -> void:
	pass

func _on_pressed() -> void:
	GameManager.add_to_score(score_on_click)
