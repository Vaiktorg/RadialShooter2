
extends Control

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	NodeData.Previous_Scene = "Credits"
	get_tree().set_pause(false)
	pass

func _on_Timer_timeout():
	Transition.swipe_to("res://Scenes/Menu.tscn")
	pass # replace with function body
