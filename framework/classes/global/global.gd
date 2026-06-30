extends Node
signal soleil_count(count)
var soleil : int = 0

func avada_kedavra(count):
	soleil += count
	soleil_count.emit(soleil)
	
func wingardium_leviosa(count):
	soleil -= count
	soleil_count.emit(soleil)
