extends Node2D

const MAX_SPEED = 300.0
const IDLE_SPEED = 10.0
const ACCEL = 5.0
const VSCALE = 0.5
const WALK_INTERVAL = 0.1

var speed = Vector2()
var current_anim = ""
var current_mirror = false

var walk_countdown = 0


# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _fixed_process(delta):
	#var dir = Vector2()
	walk_countdown -= delta
	if (walk_countdown <= 0):
		var position = get_node("player").get_pos()
		if (Input.is_action_pressed("up")):
			position += Vector2(0, -32)
		if (Input.is_action_pressed("down")):
			position += Vector2(0, 32)
		if (Input.is_action_pressed("left")):
			position += Vector2(-32, 0)
		if (Input.is_action_pressed("right")):
			position += Vector2(32, 0)
		get_node("player").set_pos(position)
		walk_countdown = WALK_INTERVAL
	
	#if (dir != Vector2()):
	#	dir = dir.normalized()
	#speed = speed.linear_interpolate(dir*MAX_SPEED, delta*ACCEL)
	#var motion = speed*delta
	#motion.y *= VSCALE
	#motion = move(motion)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
