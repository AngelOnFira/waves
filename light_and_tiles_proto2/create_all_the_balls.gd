extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	for i in range(0,8):
		var ball  = preload("res://anti_gravity_ball.tscn").instance()
		print(ball.set_pos(self.get_pos()))
		#print(get_tree().get_current_scene().add_child(ball))
		#get_tree().get_current_scene().add_child(ball)
		self.add_child(ball)
		#get_parent().get_parent().add_child(ball)
	pass
