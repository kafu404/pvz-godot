class_name  HUD
extends Control
@onready var soleil_label: Label = $soleilCount/HBoxContainer/Label
@onready var button_cancel: Button = $Button_cancel

func _ready():
	Global.soleil_count.connect(soleil_count)
	GameManager.hud = self
	activer_button_cancel(false)
	

func soleil_count(soleil: int):
	soleil_label.text = str(soleil)


func _on_button_cancel_button_down() -> void:
	GameManager.cancel_plant()

func activer_button_cancel(value: bool):
	button_cancel.visible = value
