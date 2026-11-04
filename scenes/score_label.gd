extends Label

func _ready() -> void:
	update_score_text(GameManager.save.score)
	GameManager.connect("score_updated", update_score_text)

func update_score_text(score: int) -> void:
	text = str(score)
	if (score == 1):
		text += " Turnip"
	else:
		text += " Turnips"
