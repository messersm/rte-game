
extends CanvasLayer

export var min_speed = 200
export var max_speed = 300
export var star_count = 100

func _ready():
	var star_cls = ResourceLoader.load("res://levels/layers/star_sprite.res")
	
	for i in range(star_count):
		var star = star_cls.instance()
		var speed = rand_range(min_speed, max_speed)
		star.set_speed(speed)
		add_child(star)


