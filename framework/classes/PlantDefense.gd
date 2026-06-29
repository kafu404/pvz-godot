class_name PlantDefense
extends plantBase

@export var pv_extra :float = 100.0

func _ready(): 
	init_plant()
	pv_max += pv_extra
	pv += pv_extra
