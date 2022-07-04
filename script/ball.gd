extends RigidBody2D


# Declare member variables here.
const SPEED := 40.0
const MAX_SPEED := 1000.0
var sfx = "res://assets/sons/select_006.ogg"
const audio_scene = preload("res://scenes/audio_block.tscn")
var yes = true

func _process(delta):
	
	if Global.play == true and yes == true:
		linear_velocity = Vector2(rand_range(-300, 300), -300)
		yes = false

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("plane"):
		_upgrade_velocity(body)

func _on_body_exited(body: Node) -> void:
	
	if body.is_in_group("block"):
		Global.point += 1
		body.queue_free()		
		var audio = audio_scene.instance()
		get_tree().root.call_deferred("add_child", audio)
		audio.stream = load(sfx)
		audio.play()

func _upgrade_velocity(body) -> void:
	
	var speed = get_linear_velocity().length()
	var direction = position - body.global_position
	var velocity = direction.normalized() * min((speed + SPEED) + (10 * Global.point), MAX_SPEED)
	linear_velocity = velocity 

func _on_VisibilityNotifier2D_screen_exited():	
		
	get_tree().change_scene("res://scenes/game_over.tscn")
