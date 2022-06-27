extends AudioStreamPlayer2D

func _on_audio_block_finished():
	queue_free()
