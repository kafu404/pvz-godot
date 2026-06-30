class_name plantBase
extends Node

var pv : float = 100.0
@export var pv_max : float =  100.0

@export var cellule : Vector2
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D



func init_plant():
	pv = pv_max
	if animation != null:
		animation.play("idle")
	elif animated_sprite != null:
		animated_sprite.play("idle")
