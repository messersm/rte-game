extends Node2D

# subsystem type
var subsystem_type = "hardpoint"

export var fire_laser = true
export var fire_beam = true
export var fire_missile = true
export var fire_bomb = true

export var weapon_type = "laser"
export var weapon = "laser1"

var time = 0

var weapon_cls = null
var sample_player = null
var weapon_dir = null

func _ready():
	if weapon:
		weapon_dir = "res://weapons/" + weapon_type + "/" + weapon
		weapon_cls = ResourceLoader.load(weapon_dir + "/" + weapon + ".res")
		
		# add a sample player to self,
		# load the sound of the weapon
		# and add it as sample
		var weapon_smp = ResourceLoader.load(weapon_dir + "/" + weapon + ".smp")
		
		if weapon_smp:
			var sample_library = SampleLibrary.new()
			sample_library.add_sample("fire", weapon_smp)
			sample_player = SamplePlayer2D.new()
			sample_player.set_sample_library(sample_library)
			add_child(sample_player)
		else:
			print("WARNING: Couldn't find sound sample for weapon " + weapon_type + "/" + weapon)
	
		set_fixed_process(true)
	
func _fixed_process(delta):
	time -= delta

func fire(target):
	if time <= 0:
			# instantiate the weapon object, insert it in
			# in the scene root and correct its position
			var weapon_obj = weapon_cls.instance()
			get_tree().get_root().add_child(weapon_obj)
			weapon_obj.set_global_pos(get_global_pos())
			time = weapon_obj.reload_time

			# play sound
			if sample_player:
				sample_player.play("fire")
