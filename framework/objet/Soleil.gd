class_name Soleil
extends Area2D

var soleil_count :int = 25

#
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if Input.is_action_just_pressed("click_gauche"):
		print("caca")
		Global.avada_kedavra(soleil_count)
		queue_free()
