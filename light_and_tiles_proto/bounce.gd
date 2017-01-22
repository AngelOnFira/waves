extends KinematicBody2D


const SPEED = 100.0
const ACCEL = 5.0

var speed = Vector2(-5,-10)

func _fixed_process(delta):

	speed = speed.normalized()
	var motion = speed*delta*SPEED
	motion = move(motion)	
	
	var from = self.get_pos()
	var to   = self.get_pos() + speed*20
	
	#print(from,to)
	
#	if(is_colliding()):
#		var n = get_collision_normal()
#		motion = n.reflect(motion)
#		move(motion)
#		speed = motion
	var space_state = get_world_2d().get_direct_space_state()
	var ray_dict    = space_state.intersect_ray(from,to)
	if(not ray_dict.empty()):
		print("collied")
		if(abs(self.get_pos().distance_to(ray_dict.position)) < abs(speed.length()) + 1000):
			speed = ray_dict.normal.reflect(speed)
			print(speed)
			print(abs(self.get_pos().distance_to(ray_dict.position)))
	
	#print(speed)
	
	
	#if (is_colliding()):
	#	var n = get_collision_normal()
	#	motion = n.slide(motion)
	#	move(motion)
		
func _ready():
	set_fixed_process(true)
