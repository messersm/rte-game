extends Node2D

export var weapon = "laser1"
export var reload_time = 0.5

var time = 0
var weapon_cls = null

func _ready():
	if weapon:
		weapon_cls = ResourceLoader.load("res://weapons/" + weapon + ".res")
		set_fixed_process(true)

func _fixed_process(delta):
	time -= delta

	if Input.is_action_pressed("ui_accept"):
		if time <= 0:
			# instantiate the weapon object, insert it in
			# in the scene root and correct its position
			var weapon_obj = weapon_cls.instance()
			get_tree().get_root().add_child(weapon_obj)
			weapon_obj.set_global_pos(get_global_pos())
			time = reload_time
	