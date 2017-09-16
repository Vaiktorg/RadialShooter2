
extends Node2D

onready var timer = get_node("Timer")

export var speed = 10
export(float, 0, 3, .1) var rate
export(String, "Small", "Medium", "Big") var size
export(String, "Random", "Specific") var mode

var degrees = 20

var positions = []
var posIndex = 0

var asteroids = [
	load("res://MiniScenes/Asteroid1.tscn"), #Small
	load("res://MiniScenes/Asteroid2.tscn"), #Medium
	load("res://MiniScenes/Asteroid3.tscn")] #Big

# -------------------------------------------------------------------------

func _ready():
	set_process(true)
	timer.set_wait_time(rate)

	positions.append(get_node("Position2D").get_global_pos())
	positions.append(get_node("Position2D1").get_global_pos())
	positions.append(get_node("Position2D2").get_global_pos())
	positions.append(get_node("Position2D3").get_global_pos())
	positions.append(get_node("Position2D4").get_global_pos())
	positions.append(get_node("Position2D5").get_global_pos())
	positions.append(get_node("Position2D6").get_global_pos())
	positions.append(get_node("Position2D7").get_global_pos())
# -------------------------------------------------------------------------

func _process(delta):
	if degrees >= 360:
		degrees = 0
	self.set_rotd(degrees)
	degrees += speed

	if posIndex > 8 or posIndex < 0:
		posIndex = 0

# -------------------------------------------------------------------------

func _on_Timer_timeout():
	if mode == "Random":
		randomize()
		var selection = randi() % 3
		timer.start()
		instance_scene(asteroids[selection])

	if mode == "Specific":
		if size == "Small":
			instance_scene(asteroids[0])
		if size == "Medium":
			instance_scene(asteroids[1])
		if size == "Big":
			instance_scene(asteroids[2])

# -------------------------------------------------------------------------

func instance_scene(scene):
	var tempast = scene.instance()
	get_tree().get_root().add_child(tempast)
	tempast.set_pos(positions[posIndex])

	posIndex = randi() % 8
	pass