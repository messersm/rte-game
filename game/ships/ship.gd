
extends KinematicBody2D

export var hull = 2000
export var shields = 200
export var description = ""

# current value of hull and shields
var _hull = hull
var _shields = shields


func _ready():
	# Initialization here
	pass
	
func apply_damage(hulldmg, shielddmg, subsysdmg):
	_shields -= shielddmg
	if _shields <= 0:
		_shields = 0
		
		_hull -= hulldmg
		if _hull <= 0:
			queue_free()