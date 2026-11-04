extends Label

func _ready() -> void:
	update_score_text(GameManager.score)
	GameManager.connect("score_updated", update_score_text)

func update_score_text(score: int) -> void:
	text = "Score: " + str(score)
