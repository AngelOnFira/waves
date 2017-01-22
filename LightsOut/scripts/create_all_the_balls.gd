extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var time = -1


func addBalls():
	print(self.get_parent())
	if(time < 0):
		time = 5
		for i in range(0,50):
			var ball  = preload("res://nodes/Ball.tscn").instance()
			ball.set_pos(get_parent().get_pos())
			ball.avoid = self.get_parent()
			get_parent().get_parent().call_deferred("add_child", ball)
		
func _fixed_process(delta):
	time -= delta
		
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
