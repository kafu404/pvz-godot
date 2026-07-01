class_name Cellule
extends Area2D

var position_cellule : Vector2i

func _on_mouse_entered() -> void:
	GameManager.refresh_cellule(position_cellule, self)

func _on_mouse_exited() -> void:
	pass # Replace with function body.
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click_gauche"):
		GameManager.placer_plante()
