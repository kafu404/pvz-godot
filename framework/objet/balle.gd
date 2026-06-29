class_name Balle
extends Area2D
const EXPLOSION = preload("uid://dfid14g34rkfq")

var speed : float = 100.0

func _physics_process(delta: float):
	position.x = speed * delta



func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body: Node2D):
	pass
	#if body is Zombie : 
		#var explo = EXPLOSION.instantiate()
		#get_tree().current_scene.add_child(explo)
		#explo.global_position = global_position
		#queue_free()
