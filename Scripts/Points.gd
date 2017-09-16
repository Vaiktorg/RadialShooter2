extends Node2D

var points = 0
var wave = 1
var metadata = {}
var weapon_temp = 0

func _ready():
	points = 0
	wave = 1
	weapon_temp = 0
	pass

func _process():
	pass

func add_points(val):
	points += val
	pass

func get_temp():
	return weapon_temp

func add_temp(val):
	weapon_temp += val

func reduce_temp(val):
	if weapon_temp >= 100:
		weapon_temp = 100
	elif weapon_temp <= 0:
		weapon_temp = 0

	weapon_temp -= val * get_process_delta_time()