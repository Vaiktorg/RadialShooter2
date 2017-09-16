
extends Area2D

func _on_LimitArea_body_exit( body ):
	if body.is_in_group("Limited"): #if body is in group "Limited", as in they are limited to an area...
		body.queue_free() #Destroy that body.
		
#Esto es para no dejar bodies volando en el space, para que no se acumulen y reduzca el performance.
