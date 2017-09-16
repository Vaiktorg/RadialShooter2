
extends KinematicBody2D

export(float) var speed = 200
var direction
export(float) var damage = 1

func _ready():
	set_process(true)
	pass
	
func _process(delta):
	
	if is_colliding():
		if get_collider() != null:
			if get_collider().is_in_group("Destroyable"):
				if get_collider().is_in_group("Asteroid"):
					get_collider().set_damage(damage)
			queue_free()
	
	move(direction * speed * delta)
	
	

func set_direction(val): 
	direction = Vector2(sin(deg2rad(-val)), -cos(deg2rad(-val)))
	
