
extends KinematicBody2D

export(String, "Normal", "Uncommon", "Rare") var rarity
export(bool) var random

var types = ["2xSpeed", "DoubleBlaster"]
var type_sel

onready var sprite = get_node("Sprite")

var sprites = {"DSpeed":preload("res://Images/pickups/double_speed_icon.png"),
"DoubleBlaster":preload("res://Images/pickups/double_blaster_icon.png")}

func _ready():
	if random:
		type_sel = types[round(rand_range(0,1))]
		print(type_sel)
		if type_sel == "2xSpeed":
			sprite.set_texture(sprites.DSpeed)
		elif type_sel == "DoubleBlaster":
			sprite.set_texture(sprites.DoubleBlaster)

	set_process(true)

func _process(delta):
	var dir = Vector2(NodeData.Data.CorePos - get_pos()).normalized()
	move(dir)

func _on_Area2D_body_enter( body ):
	if body.get_name() == "Nave":
		if type_sel == "DoubleBlaster":
			body.weapon.upgrade_weapon(type_sel)
		elif type_sel == "2xSpeed":
			body.shootspeed = "Double"
			body.speed_time.set_value(100)
		queue_free()
	elif body.get_name() == "Orbit" or body.get_name() == "Core":
		queue_free()
	pass
