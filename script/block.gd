extends StaticBody2D

var sfx = "res://assets/sons/select_006.ogg"
const audio_scene = preload("res://scenes/audio_block.tscn")

func body_entered(body):

	if body.is_in_group("ball"):
		Global.point += 1
		queue_free()		
		var audio = audio_scene.instance()
		get_tree().root.call_deferred("add_child", audio)
		audio.stream = load(sfx)
		audio.play()

