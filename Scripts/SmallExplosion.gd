
extends Particles2D

func _ready():
	set_process(true)
	pass

func _process(delta):
	if is_emitting() == false:
		queue_free()

