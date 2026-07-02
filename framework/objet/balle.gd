class_name Balle
extends Area2D
const EXPLOSION = preload("res://framework/objet/explosion.tscn")


var speed : float = 300.0

func _physics_process(delta: float):
	position.x += speed * delta




func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	pass

func _on_area_entered(area: Area2D) -> void:
	var target_zombie = area.get_parent()
	if target_zombie is Zombie_base : 
		var explo = EXPLOSION.instantiate()
		get_tree().current_scene.add_child(explo)
		explo.global_position = global_position
		target_zombie.attack_taken(25)
		queue_free()
