extends KinematicBody2D

export var speed = 20.0
export var weapon_range = 100.0
export var shield_damage = 1
export var hull_damage = 1
export var sub_damage = 1
export var sound = ""
export var sprite = ""

var dir
var time
var sampleplayer

func _ready():
	set_fixed_process(true)
	
	# calculate time to live
	if speed > 0:
		time = weapon_range / speed
	else:
		time = 0
	
	# find the sampleplayer in the scene (if there is one)
	sampleplayer = get_node("/root/sampleplayer")
	if not sampleplayer:
		print("Warning: sampleplayer not found - you'll have no sound.")
	
	# play sound
	if sound and sampleplayer:
		sampleplayer.play(sound)

func _fixed_process(delta):
	# remove the weapon, if the time is up
	time -= delta
	if time <= 0:
		queue_free()

	move(Vector2(0, - speed) * delta)

