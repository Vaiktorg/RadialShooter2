
extends Node2D

var bulletscene = preload("res://MiniScenes/Bullet.tscn")

export(String, "Blaster", "DoubleBlaster", "2xSpeed") var weapon = "Blaster"

onready var blaster_pos = get_node("BulletSpawnBlaster")
onready var dblaster_pos = get_node("BulletSpawnDBlaster")
onready var dblaster_pos1 = get_node("BulletSpawnDBlaster1")
onready var sprite = get_node("Sprite")

onready var blaster_sprite = preload("res://Images/weapon/player_blaster.png")
onready var dblaster_sprite = preload("res://Images/weapon/player_double_blaster.png")

var degrees
var temp = 0

func _ready():
	set_process(true)
	set_process_input(true)
	pass

func _input(event):
	if event.is_action_pressed("UpScale"):
		if weapon == "DoubleBlaster":
			weapon = "Blaster"
		else:
			weapon = "DoubleBlaster"

func _process(delta):
	if weapon == "Blaster":
		sprite.set_texture(blaster_sprite)
	elif weapon == "DoubleBlaster":
		sprite.set_texture(dblaster_sprite)
	degrees = get_parent().get_rotd()

	if !Input.is_action_pressed("UpScale"):
		Points.reduce_temp(3)

func shoot():
	if weapon == "Blaster":
		spawn_bullet(blaster_pos,bulletscene)
	elif weapon == "DoubleBlaster":
		spawn_bullet(dblaster_pos,bulletscene)
		spawn_bullet(dblaster_pos1,bulletscene)
		Points.add_temp(3)

		if Points.get_temp() >= 100:
			weapon = "Blaster"

func upgrade_weapon(name):
	weapon = name
	pass

func spawn_bullet(position, bullet_scene):
	var bullet = bullet_scene.instance()
	get_tree().get_root().add_child(bullet)
	bullet.set_pos(position.get_global_pos())
	bullet.set_direction(degrees)
	bullet.set_rotd(degrees)