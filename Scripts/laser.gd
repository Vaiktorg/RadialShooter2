
extends Node2D

onready var raycast = get_node("RayCast2D")
onready var Middle = get_node("RayCast2D/Middle")
onready var Start = get_node("RayCast2D/Start")
onready var End = get_node("RayCast2D/End")

func _ready():
	set_process(true)
	pass

func _process(delta):
	End.set_pos(Vector2(raycast.physic


