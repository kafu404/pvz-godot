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
@onready var sprite_2d_2: Sprite2D = $Sprite2D2

func _ready():
	init_plant()
	timer.wait_time = temp_de_disparition
	timer.timeout.connect(disparait)
	timer.start()

func disparait(): 
	if zombie_atteignable:
		#attack.visible = true
		#sprite_2d_2.visible = false
		animation_Pea.play("shoot")
		

func spawnear_balle():
	print("aaaaaaaaaaaaaaaaaaaaaaaaaaaa")
	var oui : Balle = balle_instance.instantiate()
	get_tree().current_scene.add_child(oui)
	oui.global_position = marker_2d.global_position

func _on_animation_player_animation_finished(anim_name: StringName):
	if anim_name == "shoot":
		#attack.visible = false
		#sprite_2d_2.visible = true
		animation_Pea.play("idle")
