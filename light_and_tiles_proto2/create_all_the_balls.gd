extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


func addBalls():
	for i in range(0,20):
		var ball  = preload("res://anti_gravity_ball.tscn").instance()
		ball.set_pos(get_parent().get_pos())
		#print(get_tree().get_current_scene().add_child(ball))
		#get_tree().get_current_scene().add_child(ball)
		#self.add_child(ball)
		get_parent().get_parent().call_deferred("add_child", ball)
		#print(get_parent().get_parent().get_parent().get_parent())
		
func _ready():
	addBalls()
