extends Sprite

var speed = 20

func _ready():
	var pos = get_pos()
	pos.x = rand_range(0, 1280)
	pos.y = rand_range(0, 720)
	set_pos(pos)
	
	set_fixed_process(true)

func _fixed_process(delta):
	var pos = get_pos()
	pos.y += speed * delta
	
	if pos.y >= 720:
		pos.y = fmod(pos.y, 720)
		pos.x = rand_range(0, 1280)
	
	set_pos(pos)

func set_speed(val):
	speed = val