extends Panel

@onready var name_label: Label = $Name
@onready var number: Label = $Number
@onready var description: Label = $Description
@onready var buy_button: Button = $BuyButton
@onready var texture_rect: TextureRect = $TextureRect

@export_enum("TurnipsOnClick", "Shovels") var upgrade: String

func _ready() -> void:
	GameManager.connect("score_updated", update_price)
	
func update_price(score: int) -> void:
	var price := GameManager.save.prices[upgrade]
	buy_button.text = "Buy: " + str(price) + " Turnips"
	buy_button.disabled = price > GameManager.save.score

func _on_buy_button_pressed() -> void:
	GameManager.purchase_upgrade(upgrade)
