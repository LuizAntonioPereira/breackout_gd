extends Node2D


func _ready():
	$lbl_num.text = str(Global.point)

func btn_pressed():
	get_tree().change_scene("res://scenes/Game.tscn")
