extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var walkTime = -1
var shoutTime = -1

func addBalls(var numBalls, var type):
	#print(self.get_parent())
	if (type == "WALK" and walkTime < 0 or type == "SHOUT" and shoutTime < 0 and get_tree().get_current_scene().get_name().right(1) != "1"):
		print(get_tree().get_current_scene().get_name().right(1))
		if (type == "WALK"):
			walkTime = rand_range(0.2, 0.35)
		if (type == "SHOUT"):
			shoutTime = 5
			
		for i in range(0, numBalls):
			var ball  = preload("res://nodes/Ball.tscn").instance()
			ball.set_pos(get_parent().get_pos())
			ball.avoid = self.get_parent()
			get_parent().get_parent().call_deferred("add_child", ball)
		
func _fixed_process(delta):
	walkTime -= delta
	shoutTime -= delta
		
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
