extends Monde

@onready var cellule: Node2D = $Cellule
@onready var plant: Node2D = $Plant
@onready var cursor_plante: CursorPlante = $cursorPlante
@onready var TimerRound: Timer = $TimerRound



func _ready():
	GameManager.current_world = self
	GameManager.plante_cursor = $cursorPlante

	create_cellule()
	cellule.visible = false
	await get_tree().create_timer(3.0).timeout
	initialiser_monde()
	
func montrer_cellule(valeur: bool):
	cellule.visible = valeur
func create_cellule():
	var cellule_paquet := load("res://framework/classes/celulle.tscn")
	for x in range(0,9):
		for y in range(0,5):
			var nouveau_cellule = cellule_paquet.instantiate()
			cellule.add_child(nouveau_cellule)
			nouveau_cellule.position = Vector2(40,50)+ (Vector2(x,y) * Vector2(55, 70) * 1.5)
			nouveau_cellule.position_cellule = Vector2i(x,y)
