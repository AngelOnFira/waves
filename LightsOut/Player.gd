extends KinematicBody2D

const MAX_SPEED = 300.0
const ACCEL = 5.0

var speed = Vector2()

func _fixed_process(delta):
	var dir = Vector2()
	if (Input.is_action_pressed("move_up")):
		dir += Vector2(0, -1)
	if (Input.is_action_pressed("move_down")):
		dir += Vector2(0, 1)
	if (Input.is_action_pressed("move_left")):
		dir += Vector2(-1, 0)
	if (Input.is_action_pressed("move_right")):
		dir += Vector2(1, 0)
	
	if (dir != Vector2()):
		dir = dir.normalized()
	speed = speed.linear_interpolate(dir*MAX_SPEED, delta*ACCEL)
	var motion = speed*delta
	motion = move(motion)	
	
	if (is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		move(motion)
		
func _ready():
	set_fixed_process(true)
