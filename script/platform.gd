extends KinematicBody2D


# Declare member variables here.
export (int) var speed = 150
var move = Vector2()

func _ready():
	pass

func get_input():	

	if Input.is_action_pressed("ui_right"):
		move.x =+ 1
	if Input.is_action_pressed("ui_left"):
		move.x =- 1

	move = move.normalized() * speed

func _physics_process(delta):
	
	if Global.play == true:
		get_input()
		move = move_and_slide(move * delta * speed)
