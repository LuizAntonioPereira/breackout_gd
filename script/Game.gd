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

func _process(delta):
	
	$points.text =	str(Global.point)

func create_block():
	
	for i in range(8):
		for j in range(8):
			var block = bk.instance()
			block.position = Vector2(x + y * (j),a + b * i)
			num += 1
			add_child(block)			

func _on_btn_start_pressed():
	
	$start.visible = false
	$Label.visible = false
	$Label2.visible = false
	$platform.visible = true
	$ball.visible = true
	Global.play = true
	create_block()
