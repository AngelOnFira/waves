extends Node

# This is run on startup :D
var currentLevel = 1
const max_level = 1

var currentScene = null

# Taken primarily from games from scratch tutorial 6
func set_scene(scenePath):
	#get_tree().change_scene("res://"+scenePath+".tscn")
	
	var level 		= min(max_level, currentLevel)
	print("res://Level_"+str(level)+".tscn")
	currentLevel 	= level
	get_tree().change_scene("res://levels/Level_"+str(level)+".tscn")
	currentLevel	+= 1
	

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here	
	# Back the background colour black
	VisualServer.set_default_clear_color(Color(0,0,0,1.0))
	set_scene("MainScene")
	print("Game Loaded.")
