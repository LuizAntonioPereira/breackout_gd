extends Node2D


# Declare member variables here.

onready var bk = preload("res://scenes/block.tscn")
var x = 50
var y = 70
var a = 70
var b = 40
var num = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.play = false	
	Global.point = 0
			
	for child in get_children().find("block"):
		child.queue_free()
	

	pass # Replace with function body.


func _process(delta):
	
	$points.text =	str(Global.point)
	if Global.play == true:
		create_block()		
	pass

func create_block():
	
	for i in range(8):
		for j in range(8):
			var block = bk.instance()
			block.position = Vector2(x + y * (j),a + b * i)
			num += 1
			add_child(block)
	pass


func _on_btn_start_pressed():
	
	$start.visible = false
	$platform.visible = true
	$ball.visible = true
	Global.play = true
