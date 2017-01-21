extends Node

# This is run on startup :D

var currentLevel = 0
var currentScene = null

# Taken primarily from games from scratch tutorial 6
func set_scene(scenePath):
	get_tree().change_scene("res://"+scenePath+".tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here	
	# Back the background colour black
	VisualServer.set_default_clear_color(Color(0,0,0,1.0))
	set_scene("MainScene")
	print("Game Loaded.")
