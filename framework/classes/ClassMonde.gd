class_name Monde
extends Node2D

@export var round_count : int = 0
@export var round_quant : int = 5
@export var ennemy_par_round :Array[int]= [2]
@export var temp_de_round :Array[float] = [3.0]
@export var node_ligne : Node2D
var ennemy_total : int = 0
var timer_round : Timer
var ennemy_total_round: int = 0
var ennemy_count : int = 0
func initialiser_monde():
	timer_round = Timer.new()
	timer_round.one_shot = true
	timer_round.autostart = false
	timer_round.wait_time = temp_de_round[0]
	
	timer_round.timeout.connect(initialiser_round)
	timer_round.start()
	
	for ennemy in ennemy_par_round:
		ennemy_total += ennemy_total

func initialiser_round():
	if(round_count >= round_quant):
		return
	if ennemy_par_round.size() >= round_count || temp_de_round.size() < round_count:
		return
	spawnear_ennemy(ennemy_par_round[round_count])
	timer_round.wait_time = temp_de_round[round_count]
	timer_round.start()
func spawnear_ennemy(total : int):
	pass
	
func ennemy_mort():
	ennemy_count -= 1
