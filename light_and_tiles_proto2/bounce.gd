extends KinematicBody2D

const SPEED = 500.0
const ACCEL = 5.0
var life 	= 2

var speed = Vector2()

func _fixed_process(delta):
	
	speed = speed.normalized()
	var motion = speed*delta*SPEED
	motion = move(motion)
	
	var from = self.get_pos()
	var to   = self.get_pos() + speed*20
	
	var space_state = get_world_2d().get_direct_space_state()
	var ray_dict    = space_state.intersect_ray(from,to)
	if(not ray_dict.empty()):
		if(abs(self.get_pos().distance_to(ray_dict.position)) < abs(speed.length()) + 1000):
			speed = ray_dict.normal.reflect(speed)
#	
	
	life -= delta
	if (life < 0):
		self.queue_free()
	#print(life)
	
func _ready():
	speed = Vector2(rand_range(-1,1),rand_range(-1,1))
	print("load")
	set_fixed_process(true)
