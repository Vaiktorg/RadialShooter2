
extends Node

var index = 0
var sel0 = Vector2(160,144)
var sel1 = sel0 * 2
var sel2 = sel0 * 4

func _ready():
	set_process_input(true)
	set_process(true)
	pass

func _input(event):
	if event.is_action_pressed("UpScale"):
		index += 1

func _process(delta):
	if index > 2: index = 0
	
	if index == 0: OS.set_window_size(sel0)
	elif index == 1: OS.set_window_size(sel1)
	elif index == 2: OS.set_window_size(sel2)
