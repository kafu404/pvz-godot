class_name PlantAttaque
extends plantBase


@export var degat_par_tir :float = 25
@export var temp_de_disparition :float = 1.0
@export var balle_instance : PackedScene
#var delai_tire : bool = true
var zombie_atteignable := true
@onready var timer: Timer = $Timer
@onready var marker_2d = $Marker2D
@onready var animation_Pea: AnimationPlayer = $AnimationPlayer

func _ready():
	init_plant()
	timer.wait_time = temp_de_disparition
	timer.timeout.connect(disparait)
	timer.start()

func disparait(): 
	if zombie_atteignable:
		animation_Pea.play("shoot")

func spawnear_balle():
	var balle : Balle = balle_instance.instantiate()
	get_tree().current_scene.add_child(balle)
	balle.global_position = marker_2d.global_position
	print("chius appellé")

func _on_animation_player_animation_finished(anim_name: StringName):
	if anim_name == "shoot":
		animation_Pea.play("idle")
