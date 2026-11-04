class_name SaveGame
extends Resource

const SAVE_GAME_PATH: String = "user://save.tres"

### Turnip Tapper Data

@export var score: int

@export var upgrades_unlocked: Dictionary[String, int] = {
	"TurnipsOnClick": 1,
	"Shovels": 0
}

@export var prices: Dictionary[String, int] = {
	"TurnipsOnClick": 500,
	"Shovels": 10
}

### Save Functions

func write_save() -> void:
	ResourceSaver.save(self, SAVE_GAME_PATH)

func get_temp_save() -> SaveGame:
	return self.duplicate()

static func save_exists() -> bool:
	return ResourceLoader.exists(SAVE_GAME_PATH)

static func delete_save() -> void:
	if save_exists():
		print("Deleting save")
		DirAccess.remove_absolute(ProjectSettings.globalize_path(SAVE_GAME_PATH))
		# save.remove(SAVE_GAME_PATH)

static func load_save() -> SaveGame:
	if save_exists():
		print("Loaded existing save")
		return ResourceLoader.load(SAVE_GAME_PATH)
	return SaveGame.new()
