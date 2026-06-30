class_name Balle
extends Area2D
const EXPLOSION = preload("res://framework/objet/explosion.gd")

var speed : float = 300.0

func _physics_process(delta: float):
	position.x += speed * delta




func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

#body: Node2D
func _on_body_entered():
	pass
	#if body is Zombie : 
		#var explo = EXPLOSION.instantiate()
		#get_tree().current_scene.add_child(explo)
		#explo.global_position = global_position
		#queue_free()
