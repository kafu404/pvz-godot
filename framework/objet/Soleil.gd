class_name Soleil
extends Area2D



func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if Input.is_action_just_pressed("click_gauche"):
		print("caca")
		queue_free()
