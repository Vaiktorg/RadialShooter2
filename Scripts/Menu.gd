
extends Node

onready var playbtn = get_node("Panel/PlayBtn")
onready var quitbtn = get_node("Panel/Quit")
onready var score = get_node("Panel/TopScore/Score")
onready var sample = get_node("SamplePlayer")
var scene = "res://Scenes/Main.tscn"


func _ready():
	set_process_input(true)
	playbtn.grab_focus()

	if SaveSystem.can_load():
		SaveSystem.load_file()
		score.set_text(str(SaveSystem.metadata.Score))
	pass

func _input(event):
	if event.is_action_pressed("ui_up") and !playbtn.has_focus():
		sample.play("Select")
	if event.is_action_pressed("ui_down") and !quitbtn.has_focus():
		sample.play("Select")
	if event.is_action_pressed("ui_accept"):
		sample.play("Accept")
	pass

func _on_PlayBtn_pressed():
	Transition.swipe_to(scene)
	pass # replace with function body


func _on_Quit_pressed():
	get_tree().quit()
	pass # replace with function body
