
extends Node2D

onready var timer = get_node("Timer")

export var speed = 10
export(float) var rate
export(String, "Small", "Medium", "Big") var size
export(String, "Random", "Specific") var mode

var degrees = 20

var spawners = []
var positions = []
var posIndex = 0

var asteroids = [
	load("res://MiniScenes/Asteroid1.tscn"), #Small
	load("res://MiniScenes/Asteroid2.tscn"), #Medium
	load("res://MiniScenes/Asteroid3.tscn")] #Big

# -------------------------------------------------------------------------

func _ready():
	set_process(true)
	
	NodeData.add_data("SpawnRate", rate)
	
	spawners.append(get_node("Position2D"))
	spawners.append(get_node("Position2D1"))
	spawners.append(get_node("Position2D2"))
	spawners.append(get_node("Position2D3"))
	
	positions.append(spawners[0].get_pos())
	positions.append(spawners[1].get_pos())
	positions.append(spawners[2].get_pos())
	positions.append(spawners[3].get_pos())

# -------------------------------------------------------------------------

func _process(delta):
	if degrees >= 360:
		degrees = 0
	self.set_rotd(degrees)
	degrees += speed

	if posIndex > 3 or posIndex < 0:
		posIndex = 0
		
	positions[0] = spawners[0].get_global_pos()
	positions[1] = spawners[1].get_global_pos()
	positions[2] = spawners[2].get_global_pos()
	positions[3] = spawners[3].get_global_pos()
	
	timer.set_wait_time(NodeData.Data.SpawnRate)

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

	posIndex = randi() % 4
	pass