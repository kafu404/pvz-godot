class_name CursorPlante
extends Node2D
@onready var sprite: Sprite2D = $Sprite2D

func actualiser_visuel(plant : PanelPlante):
	if plant == null:
		sprite.texture = null
		return
	sprite.texture = plant.texture
	
func etablir_cellule_valide(valeur : bool):
	if valeur:
		sprite.self_modulate = Color(1, 1, 0.5)
	else:
		sprite.self_modulate = Color(0.986, 0.0, 0.163, 1.0)
