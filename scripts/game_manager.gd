# autoloads as GameManager
extends Node

var score: int = 0

signal score_updated(new_score: int)

func add_to_score(amount: int) -> void:
	# Amount may be negative
	score += amount
	score_updated.emit(score)
