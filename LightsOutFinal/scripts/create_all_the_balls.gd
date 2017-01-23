extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var walkTime = -1
var shoutTime = -1

const WALK = 1
const SHOUT = 2
const SHOUT_TIMER = 5
const WALK_TIMER  = 0.2


func addBalls(var numBalls, var type):
	#print(self.get_parent())
	if (type == "WALK"):
		type = WALK
		#print("WALK")
	elif(type == "SHOUT"):
		type = SHOUT
	else:
		type = -1
	
	if (type == WALK and walkTime < 0 or type == SHOUT and shoutTime < 0 and get_tree().get_current_scene().get_name().right(1) != "1"):
		#print(get_tree().get_current_scene().get_name().right(1))
		if (type == WALK):
			walkTime = rand_range(WALK_TIMER+0.15, WALK_TIMER)
		if (type == SHOUT):
			shoutTime = SHOUT_TIMER
			
		for i in range(0, numBalls):
			var ball  = preload("res://nodes/Ball.tscn").instance()
			if(type == WALK):
				ball.MAX_LIFE 	= 0.5
				ball.MIN_LIFE 	= 0.25
				ball.SPEED		= 20.0
				print(ball)
			elif(type == SHOUT):
				ball.MAX_LIFE = 6
				ball.MIN_LIFE = 4
				
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
