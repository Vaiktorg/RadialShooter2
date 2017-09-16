
extends KinematicBody2D

var degrees = 0
var dir
var motion = Vector2()
var xaxis
var yaxis

export(float) var rot_speed = 90
export(float) var max_speed = 190
onready var sound = get_node("SamplePlayer")
onready var orbit = get_node("../Orbit")
onready var weapon = get_node("Weapon")
onready var speed_time = get_parent().get_node("HUD/Progress/ProgressBar1")

export(String, "Normal", "Double") var shootspeed = "Normal"

# --------------------------------------------------------------------------

func _ready():
	set_process_input(true)
	set_process(true)

func _process(delta):
	orbit_movement(delta)
	
	if shootspeed == "Double":
		speed_time.set_value(speed_time.get_value()-10*delta)
		if speed_time.get_value() == 0:
			shootspeed = "Normal"
	

func _input(event):
	if shootspeed == "Normal":
		if event.is_action_pressed("Shoot"):
			Sound.play("Shoot")
			weapon.shoot()
	
	if shootspeed == "Double":
		if event.is_action_pressed("Shoot") or event.is_action_released("Shoot"):
			Sound.play("Shoot")
			weapon.shoot()
# --------------------------------------------------------------------------

func orbit_movement(delta):
	if Input.is_action_pressed("Left"): #Input Left (Left Arrow, 'A') is true by tick.
		degrees += (rot_speed * delta) #Math to move degrees right.
	elif Input.is_action_pressed("Right"): #input Right (Right Arrow, 'D') is true by tick.
		degrees -= (rot_speed * delta) #Math to move degrees left.
		
	elif Input.is_action_pressed("Down"):
		degrees += (rot_speed * delta / 3)
	elif Input.is_action_pressed("Up"):
		degrees -= (rot_speed * delta / 3)
	
	if degrees >= 360 or degrees <= -360: #Clamped degrees incase we could use this variable for something.
		degrees = 0
		
	set_rotd(degrees) #set_rotd(degrees) will rotate the actor in degrees. Note the 'd' after 'rot'.