extends KinematicBody2D

var xspeed = 600
var yspeed = 600


func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var dx = 0
	var dy = 0

	if Input.is_action_pressed("ui_left"):
		dx = - xspeed
	elif Input.is_action_pressed("ui_right"):
		dx = xspeed
		
	if Input.is_action_pressed("ui_up"):
		dy = - yspeed
	elif Input.is_action_pressed("ui_down"):
		dy = yspeed
	
	move( Vector2(dx, dy) * delta )