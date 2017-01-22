extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var old_sprite = null
var old_occluder = null
var old_collision = null

func _reveal(body):
	old_sprite = get_node("Sprite")
	old_occluder = get_node("LightOccluder2D")
	old_collision = get_node("CollisionShape2D")
	remove_child(old_occluder)
	remove_child(old_sprite)
	remove_child(old_collision)
	
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
