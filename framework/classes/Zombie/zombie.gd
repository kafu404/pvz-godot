class_name Zombie_base
extends CharacterBody2D
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var attack_timer: Timer = $Timer
@onready var animation_degat: AnimationPlayer = $AnimationDegat

@export var attack : float = 20
@export var speed:float = 20.0
@export var pv_max : float = 200
var pv_actuel : float = 100
var temp_attack :float = 1.5
enum {WALK, ATTACK, DIE}
var direction := -1
var etat_actuel = WALK
var etat_present

var plant = plantBase

func _ready() -> void:
	attack_timer.wait_time = temp_attack
	attack_timer.connect("timeout", attack_plant)
	pv_actuel = pv_max

func _physics_process(delta: float) -> void:
	if etat_present != etat_actuel:
		match etat_actuel:
			WALK:
				animation.play("walk")
				
			ATTACK:
				pass
			DIE:
				pass
	if etat_actuel == WALK:
		velocity.x = speed * direction
	else:
		velocity.x = 0
	move_and_slide()
	
func _on_detector_area_entered(area: Area2D) -> void:
	print("aleeeeeeeeeeeeeeeeeeeeeeeeeeed")
	etat_actuel = ATTACK
	plant = area.get_parent()
	attack_plant()

func _on_detector_area_exited(area: Area2D) -> void:
	pass # Replace with function body.
	etat_actuel = WALK
	plant = null
	attack_timer.stop()

func attack_plant():
	if plant != null:
		plant.degat_recu(attack)
		attack_timer.start()

func attack_taken(damage : float):
	pv_max -= damage
	animation_degat.play("degat")
	if pv_max <= 0:
		queue_free()
		return
	
