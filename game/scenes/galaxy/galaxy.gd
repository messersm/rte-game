
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

export var galaxy_seed = 0

func _ready():
	# Setup seed for galaxy
	seed(galaxy_seed)
	# Initialization here
	var star_cls = ResourceLoader.load("res://scenes/galaxy/star.res")
	for i in range(1000):
		var x = rand_range(0, 1280)
		var y = rand_range(0, 720)
		
		var star = star_cls.instance()
		star.set_pos(Vector2(x, y))
		# print(str(star) + " at (" + str(x) + ", " + str(y) + ")")
		add_child(star)


