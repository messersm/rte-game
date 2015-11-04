extends KinematicBody2D

export var reload_time = 1.0
export var speed = 20.0
export var weapon_range = 100.0
export var shield_damage = 1
export var hull_damage = 1
export var sub_damage = 1

var dir
var time

func _ready():
	set_fixed_process(true)
	
	# calculate time to live
	if speed > 0:
		time = weapon_range / speed
	else:
		time = 0

func _fixed_process(delta):
	# remove the weapon, if the time is up
	time -= delta
	if time <= 0:
		queue_free()

	move(Vector2(0, - speed) * delta)

