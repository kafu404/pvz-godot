class_name PlantGeneration
extends plantBase

@export var prix_soleil : float = 25
@export var temp_de_generation : float = 10.0
@export var scene_soleil : PackedScene
@onready var timer: Timer = $Timer




func _ready():
	init_plant()
	timer.wait_time = temp_de_generation
	timer.timeout.connect(generer_soleil)
	timer.start()
	
func generer_soleil():
	print("SOLEIL :D")
	if scene_soleil != null:
		var nouveau_soleil :  Soleil = scene_soleil.instantiate()
		get_tree().current_scene.add_child(nouveau_soleil)
		var position_rand = randf_range(-15,15)
		nouveau_soleil.global_position = self.global_position
		nouveau_soleil.global_position.x += position_rand
