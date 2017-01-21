extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _button_pressed(body):
	print(body)
	if body.get_name() == "PlayerBody":
		print("Unlock")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
