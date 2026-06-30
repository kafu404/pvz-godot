extends Control
@onready var soleil_label: Label = $soleilCount/HBoxContainer/Label

func _ready():
	Global.soleil_count.connect(soleil_count)

func soleil_count(soleil: int):
	soleil_label.text = str(soleil)
