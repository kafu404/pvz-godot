class_name plantBase
extends Node

var pv : float = 100.0
@export var pv_max : float =  100.0

@export var cellule : Vector2
@onready var animation: AnimationPlayer = $AnimationPlayer



func init_plant():
	pv = pv_max
	if animation != null:
		animation.play("idle")
	elif animation != null:
		animation.play("idle")

func degat_recu(degat : float):
	pv -= degat
	if pv <= 0:
		queue_free()
		return
