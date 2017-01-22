extends KinematicBody2D

const SPEED = 250.0
const ACCEL = 5.0
var life 	= 4
var avoid = self

var speed = Vector2()

func _fixed_process(delta):
	
	speed = speed.normalized()
	var motion = speed*delta*SPEED
	
	
	var from = self.get_pos() 
	var to   = self.get_pos() + speed*10
	
	
	
	var space_state = get_world_2d().get_direct_space_state()
	var ray_dict    = space_state.intersect_ray(from,to,[self,avoid])
	
	
	if(not ray_dict.empty()):
		if(abs(self.get_pos().distance_to(ray_dict.position)) < abs(speed.length()) + 50):
			speed = ray_dict.normal.reflect(speed)
	else:
		motion = move(motion)
#	
	
	life -= delta
	if (life < 0):
		self.queue_free()
	#print(life)
	
func _ready():
	speed = Vector2(rand_range(-1,1),rand_range(-1,1))
	life  = rand_range(4,7)
	set_fixed_process(true)
