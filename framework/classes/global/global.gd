extends Node
signal soleil_count(count)
var soleil : int = 500

func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	soleil_count.emit(soleil)

func avada_kedavra(count):
	soleil += count
	soleil_count.emit(soleil)
	
func wingardium_leviosa(count):
	soleil -= count
	soleil_count.emit(soleil)
