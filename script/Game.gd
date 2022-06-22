extends Node2D


# Declare member variables here.
onready var bk = preload("res://scenes/block.tscn")

const SAVE_DIR = "user://saves/"

var x = 50
var y = 70
var a = 70
var b = 40
var num = 0
var data = ""
var save_path = SAVE_DIR + "sava.dat"

func _ready():
	
	Global.play = false	
	Global.point = 0
	
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open_encrypted_with_pass(save_path, File.READ, "P@paB3ar6969")
		if error == OK:
			var player_data = file.get_var()
			file.close()
			TranslationServer.set_locale(player_data)

func _process(delta):
	
	$lbl_num.text =	str(Global.point)

func create_block():
	
	for i in range(8):
		for j in range(8):
			var block = bk.instance()
			block.position = Vector2(x + y * (j),a + b * i)
			num += 1
			add_child(block)			

func _on_btn_start_pressed():
	
	$start.visible = false
	$Lbl_moviment.visible = false
	$lbl_keys.visible = false
	$platform.visible = true
	$ball.visible = true
	$lbl_language.visible = false
	$btn_en.visible = false
	$btn_es.visible = false
	$btn_pt.visible = false
	$music.playing = true
	
	Global.play = true
	create_block()

func pt_pressed():
		
	$language.play()	
	data = "pt_BR"
	TranslationServer.set_locale(data)	
	save(data)

func en_pressed():
	
	$language.play()
	data = "en_US"
	TranslationServer.set_locale(data)
	save(data)

func es_pressed():
	
	$language.play()
	data = "es_ES"
	TranslationServer.set_locale(data)
	save(data)
	
func save(d):
	
	var dir = Directory.new()
	var file = File.new()
	
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var error = file.open_encrypted_with_pass(save_path, File.WRITE, "P@paB3ar6969")
	if error == OK:
		file.store_var(d)
		file.close()

func _on_language_finished():
	$language.stop()
