extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var openTexture = preload("res://assets/open.png")
var lockedTexture = preload("res://assets/door.png")

var old_collision_shape = 0 

func _button_pressed(body):
	if body.get_name() == "PlayerBody":
		get_node("Sprite").set_texture(openTexture)
		old_collision_shape = get_node("CollisionShape2D")
		remove_child(get_node("CollisionShape2D"))

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
