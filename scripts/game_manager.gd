# autoloads as GameManager
extends Node

# Save contains all data that this class uses
var save: SaveGame

signal score_updated(new_score: int)

func _ready() -> void:
	save = SaveGame.load_save()

func purchase_upgrade(name: String) -> bool:
	if save.prices[name] <= save.score:
		add_to_score(-save.prices[name])
		save.upgrades_unlocked[name] += 1
		save.prices[name] *= 2
		return true
	return false

func add_to_score(amount: int) -> void:
	# Amount may be negative
	save.score += amount
	score_updated.emit(save.score)
	save.write_save()

func clicker_pressed() -> void:
	add_to_score(save.upgrades_unlocked["TurnipsOnClick"])
	
func add_shovel_score() -> void:
	add_to_score(save.upgrades_unlocked["TurnipsOnClick"])
