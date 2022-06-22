extends StaticBody2D


func body_entered(body):

	if body.is_in_group("ball"):		
		$Audio.play()
		Global.point += 1

func Audio_finished():
	queue_free()
