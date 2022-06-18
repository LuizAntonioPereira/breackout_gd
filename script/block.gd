extends StaticBody2D


# Declare member variables here.


func _ready():
	pass

func _process(delta):	
	pass

func body_entered(body):

	if body.is_in_group("ball"):
		print(body.name)
		Global.point += 1
		queue_free()
