# Global script that is run for every scene.
# This is set to load in project settings -> autoload.

extends Node

# holds the currently loaded scene
# see run_scene()
var current_scene = null
var fullscreen = false

const FULLSCREEN_TIMEOUT = 0.5
var fullscreen_timer = 0.0

func _ready():
	# Initialization here
	# get the current scene
	var scene_idx = get_tree().get_root().get_child_count() - 1
	current_scene = get_tree().get_root().get_child(scene_idx)
	
	set_fixed_process(true)

func _fixed_process(delta):
	# exit game on "exit_game" (defaults to ALT-F4)
	if Input.is_action_pressed("exit_game"):
		get_tree().quit()
	
	# toggle fullscreen on "toggle_fullscreen" (defaults to ALT-Enter)
	if Input.is_action_pressed("toggle_fullscreen") and fullscreen_timer <= 0:
		fullscreen_timer = FULLSCREEN_TIMEOUT
		fullscreen = not fullscreen
		OS.set_window_fullscreen(fullscreen)
	
	fullscreen_timer -= delta

# scene switching code
func run_scene(filename):
	# unload the current scene
	current_scene.queue_free()
	# load the new scene class and create an instance
	current_scene = ResourceLoader.load(filename).instance()
	# add the new scene to the root
	get_tree().get_root().add_child(current_scene)
