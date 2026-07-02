class_name Monde
extends Node2D


@export var round_count : int = 0
@export var round_quant : int = 4
@export var ennemy_par_round :Array[int]= [5, 10, 20, 30]
@export var temp_de_round :Array[float] = [5.0, 10, 20, 30]
@export var node_ligne : Node2D
@export var Zombie : PackedScene
var ennemy_total : int = 0
#var timer_round : SceneTreeTimer
@onready var timer_round: Timer = $TimerRound
var ennemy_total_round: int = 0
var ennemy_count : int = 0
var random = RandomNumberGenerator.new()

@onready var marker := [
	$ligne/Marker2D,
	$ligne/Marker2D2,
	$ligne/Marker2D3,
	$ligne/Marker2D4,
	$ligne/Marker2D5
]

func initialiser_monde():
	#timer_round.create_timer(1)
	##timer_round.one_shot = true
	##timer_round.autostart = false
	##timer_round.wait_time = 3.0
	#
	#timer_round.timeout.connect(initialiser_round)
	##timer_round.start()
	##timer_round.one_shot = true
	timer_round.one_shot = true
	timer_round.wait_time = temp_de_round[1]
	timer_round.timeout.connect(initialiser_round)
	timer_round.start()

	
	for ennemy in ennemy_par_round:
		ennemy_total += ennemy

func initialiser_round():
	if(round_count >= round_quant):
		return
	#if ennemy_par_round.size() >= round_count || temp_de_round.size() < round_count:
		#return
	if round_count >= ennemy_par_round.size() or round_count >= temp_de_round.size():
		return
	spawnear_ennemy(ennemy_par_round[round_count])
	timer_round.wait_time = temp_de_round[round_count]
	timer_round.start()
	round_count += 1
	if round_count < round_quant:
		timer_round.wait_time = temp_de_round[round_count]
		timer_round.start()
func spawnear_ennemy(total : int):

	for i in total:
		var random_number = random.randf_range(0, 5)
		var oui : Zombie_base = Zombie.instantiate()
		add_child(oui)
		oui.global_position = marker[random_number].global_position
		await get_tree().create_timer(2).timeout
func ennemy_mort():
	ennemy_count -= 1
