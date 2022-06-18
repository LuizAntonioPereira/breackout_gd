extends Area2D


func body_entered(body):

	if body.is_in_group("ball"):		
		Global.point += 1
		free()
