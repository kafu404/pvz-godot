extends Node2D

var current_world : Monde
var plante_cursor : CursorPlante
var cellule_valide : bool = false
var affiche_plante_cursor : bool = false
var hud : HUD
var plant_place :  Dictionary = {}
var panel_plante : PanelPlante
var position_actuel : Vector2i
var cellule_actuel : Cellule

func _physics_process(delta: float):
	if plante_cursor != null && affiche_plante_cursor:
		plante_cursor.global_position = get_global_mouse_position()

func select_plant(plant : PanelPlante):
	if Global.soleil < plant.prix:
		return 
	panel_plante  = plant
	print("plante select")
	if affiche_plante_cursor == false:
		print("cursor")
		affiche_plante_cursor = true
		plante_cursor.actualiser_visuel(panel_plante)
		current_world.montrer_cellule(true)
		hud.activer_button_cancel(true)
	
func refresh_cellule(pos : Vector2i, cellule: Cellule):
	plante_cursor.etablir_cellule_valide(!plant_place.has(pos))
	position_actuel = pos
	cellule_actuel = cellule
	
func placer_plante():
	if panel_plante && !plant_place.has(position_actuel):
		var nouveau_plante = panel_plante.placer_plante.instantiate()
		current_world.plant.add_child(nouveau_plante)
		nouveau_plante.global_position = cellule_actuel.global_position
		plant_place[position_actuel] = nouveau_plante
		Global.wingardium_leviosa(panel_plante.prix)
		panel_plante = null
		cellule_actuel = null
		affiche_plante_cursor = false
		current_world.montrer_cellule(false)
		plante_cursor.actualiser_visuel(null)
		hud.activer_button_cancel(false)


func cancel_plant():
	panel_plante = null
	cellule_actuel = null
	affiche_plante_cursor = false
	current_world.montrer_cellule(false)
	plante_cursor.actualiser_visuel(null)
	hud.activer_button_cancel(false)
