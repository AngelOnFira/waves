extends KinematicBody2D

const MAX_SPEED = 300.0
const IDLE_SPEED = 10.0
const ACCEL = 5.0

export var speed = Vector2()

func _fixed_process(delta):
	var dir = Vector2()
	if (Input.is_action_pressed("up")):
		dir += Vector2(0, -1)
	if (Input.is_action_pressed("down")):
		dir += Vector2(0, 1)
	if (Input.is_action_pressed("left")):
		dir += Vector2(-1, 0)
	if (Input.is_action_pressed("right")):
		dir += Vector2(1, 0)
	
	if (dir != Vector2()):
		dir = dir.normalized()
	speed = speed.linear_interpolate(dir*MAX_SPEED, delta*ACCEL)
	var motion = speed*delta
	motion = move(motion)	
	

func _ready():
	set_fixed_process(true)