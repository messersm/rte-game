
extends Panel

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	get_node("NewGameButton").connect("pressed", self, "_on_new_game")

func _on_new_game():
	get_node("/root/global").run_scene("res://levels/level1.scn")