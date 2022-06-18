extends KinematicBody2D


# Declare member variables here.
var direction = Vector2.ZERO
var x = 200
var y = 700
var yes = true

func _ready():
	pass


func _physics_process(delta):
	if Global.play == true and yes == true:
		direction = Vector2(x,y)
		yes = false
	
	var col = move_and_collide(direction * delta)
	if col:
		var reflect = col.remainder.bounce(col.normal)
		direction = direction.bounce(col.normal)
		move_and_collide(reflect)
		#if ($ball.collide.name == 'block'):
		#	$ball.collide.hit()


func _on_VisibilityNotifier2D_screen_exited():
	get_tree().reload_current_scene()
