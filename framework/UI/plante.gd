class_name PanelPlante
extends Panel

@export var texture : Texture2D
@export var temp_de_recup : float = 2.0
@export var prix : int = 50
@export var placer_plante : PackedScene

func _ready():
	$TextureRect.texture = texture
	$Label.text = str(prix)
	$Timer.wait_time = temp_de_recup
	$Timer.one_shot = true

func _on_gui_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("click_gauche"):
		GameManager.select_plant(self)
