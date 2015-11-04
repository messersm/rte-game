
extends Node

func _ready():
	var shipmenu = get_node("shipmenu")

	var shipdir = Directory.new()
	shipdir.open("res://ships")
	
	shipdir.list_dir_begin()
	var item = shipdir.get_next()
	
	while item:
		if item != "." and item != "..":
			shipmenu.add_item(item)
			print(item)
		item = shipdir.get_next()
	
