extends CharacterBody2D
@onready var animation: AnimationPlayer = $AnimationPlayer

enum {WALK, ATTACK, DIE}
var direction := -1
var etat_actuel = WALK
var etat_present
var speed:float = 20.0

func _physics_process(delta: float) -> void:
	if etat_present != etat_actuel:
		match etat_actuel:
			WALK:
				animation.play("walk")
				velocity.x = speed * direction
			ATTACK:
				pass
			DIE:
				pass
	move_and_slide()


func _on_detector_area_entered(area: Area2D) -> void:
	print("aleeeeeeeeeeeeeeeeeeeeeeeeeeed")
	#etat_actuel = ATTACK


func _on_detector_area_exited(area: Area2D) -> void:
	pass # Replace with function body.
	#etat_actuel = WALK
