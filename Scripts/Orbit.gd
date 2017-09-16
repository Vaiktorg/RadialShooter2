
extends StaticBody2D

var life = 10
var dead = false

func _ready():
	NodeData.add_data("OrbitDead", dead)
	if SaveSystem.can_load():
		life = 10
	set_process(true)
	pass

func _process(delta):
	check_life()
	pass
	
func set_damage(val):
	life -= val
	
func check_life():
	if life <= 0:
		dead = true
		NodeData.add_data("OrbitDead", dead)
		queue_free()
	


