
extends StaticBody2D

var dead = false
onready var sprite = get_node("Area2D")
onready var timer = get_node("Timer")

func _ready():
	set_process(true)
	NodeData.add_data("CorePos", self.get_global_pos())
	pass
	
func _process(delta):
	check_death()

func set_dead():
	timer.start()
	dead = true
	
func check_death():
	if dead == true:
		if Points.points >= SaveSystem.metadata.Score:
			SaveSystem.add_meta("Score",Points.points)
			SaveSystem.save_file()
		sprite.queue_free()
		
		get_tree().set_pause(true)

func _on_Timer_timeout():
	Transition.fade_to("res://Scenes/Credits.tscn")
	pass # replace with function body
