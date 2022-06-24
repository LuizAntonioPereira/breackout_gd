extends KinematicBody2D


# Declare member variables here.
export (int) var speed = 300
var move = Vector2()

func get_input():	
	
	var direction = Vector2(
	Input.get_action_strength("ui_right") -
	Input.get_action_strength("ui_left"),0).normalized()
	
	move = direction * speed
	move = move_and_slide(move)

func _physics_process(delta):
	
	if Global.play == true:
		get_input()		
