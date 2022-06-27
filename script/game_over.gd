extends Node2D


func _ready():
	$lbl_num.text = str(Global.point)
	$music.play()

func _process(delta):
	if Input.is_action_just_pressed("start_enter"):
		finished()
		
func btn_pressed():
	$music2.play()

func finished():	
	get_tree().change_scene("res://scenes/Game.tscn")
