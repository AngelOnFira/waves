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
		
	if(Input.is_action_pressed("ui_accept")):
		get_node("Gen_balls_2").addBalls(30, "SHOUT")
		
	if (dir != Vector2()):
		dir = dir.normalized()
		get_node("PlayerSprite").set_rot(dir.angle() + deg2rad(-90))
		
	speed = speed.linear_interpolate(dir*MAX_SPEED, delta*ACCEL)
	var motion = speed*delta
	if (int(abs(motion.x + motion.y)) >= 1):
		#print(abs(motion.x + motion.y))
		get_node("Gen_balls_2").addBalls(int(floor(abs((motion.x + motion.y) / 2))), "WALK")
		
	motion = move(motion)
	
	if (is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		move(motion)
		
func _ready():
	set_fixed_process(true)
