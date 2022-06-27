extends KinematicBody2D


# Declare member variables here.
var speed = 400
var move = Vector2()

func get_input():	
	
	var direction = Vector2(
	Input.get_action_strength("ui_right") -
	Input.get_action_strength("ui_left"),0).normalized()
	
	move = direction * (speed + (Global.point * 10))
	move = move_and_slide(move)

func _physics_process(delta):
	
	if Global.play == true:
		get_input()		
