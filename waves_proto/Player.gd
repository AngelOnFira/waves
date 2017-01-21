extends KinematicBody2D

const MAX_SPEED = 300.0
const IDLE_SPEED = 10.0
const ACCEL = 5.0
const VSCALE = 0.5
const JUMP_TIME = 1.0 # seconds
const WAVE_START = 0.2
const WAVE_GROWTH = 1.1
const WAVE_MAX = 5 # Proof of concept; different waves should have different values

var jump = 0
var current_anim = ""
var speed = Vector2()
var current_mirror = false
var waves = []

# Makes generating new ones really quick and easy :)
var waveNode = preload("res://wave.tscn")

func draw_waves():
	for wave in waves:
		wave.scale(Vector2(WAVE_GROWTH, WAVE_GROWTH))
		if wave.get_scale().x > WAVE_MAX: 
			remove_child(wave)
			waves.remove(waves.find(wave))
		
func jump():
	jump = JUMP_TIME
	for i in range(0, 3):
		# Pull an instance of the preloaded wave out of a hat.
		var newWave = waveNode.instance()
		newWave.set_pos(Vector2(0, -36))
		newWave.set_scale(Vector2(WAVE_START+i*0.2, WAVE_START+i*0.2))
		# This list keeps track of growing
		waves.append(newWave)
		# Add it to the scene, relative (under) the PlayerController (self)
		add_child(newWave)

# Process occurs every *frame*, wheras fixed_process is physics frame.
# I put this in process because the user will certainly press on a frame, but not
# necessarily a *physics* frame. This is innefficient, but as long as there isn't many 
# things in process we're fine.
func _process(delta):
	if (jump <= 0 and Input.is_action_pressed("JUMP")):
		jump()
	

# Largely boilerplate isometric movement from the demo. 2D Gunpoint styling would simplify a little
func _fixed_process(delta):
	jump -= delta
	var dir = Vector2()
	draw_waves() # Hopefully this can be done outside of this using some wave generator script and signals
	if (Input.is_action_pressed("MOVE_UP")):
		dir += Vector2(0, -1)
	if (Input.is_action_pressed("MOVE_DOWN")):
		dir += Vector2(0, 1)
	if (Input.is_action_pressed("MOVE_LEFT")):
		dir += Vector2(-1, 0)
	if (Input.is_action_pressed("MOVE_RIGHT")):
		dir += Vector2(1, 0)
	
	if (dir != Vector2()):
		dir = dir.normalized()
	speed = speed.linear_interpolate(dir*MAX_SPEED, delta*ACCEL)
	var motion = speed*delta
	motion.y *= VSCALE
	motion = move(motion)
	
	if (is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		move(motion)

	var next_anim = ""
	var next_mirror = false
	
	if (dir == Vector2() and speed.length() < IDLE_SPEED):
		next_anim = "idle"
		next_mirror = false
	elif (speed.length() > IDLE_SPEED*0.1):
		var angle = atan2(abs(speed.x), speed.y)
		
		next_mirror = speed.x > 0
		if (angle < PI/8):
			next_anim = "bottom"
			next_mirror = false
		elif (angle < PI/4 + PI/8):
			next_anim = "bottom_left"
		elif (angle < PI*2/4 + PI/8):
			next_anim = "left"
		elif (angle < PI*3/4 + PI/8):
			next_anim = "top_left"
		else:
			next_anim = "top"
			next_mirror = false
	
	if (next_anim != current_anim or next_mirror != current_mirror):
		get_node("Player").set_flip_h(next_mirror)
		#get_node("anim").play(next_anim)
		current_anim = next_anim
		current_mirror = next_mirror

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	set_process_input(true)
	set_process(true)
	VisualServer.set_default_clear_color(Color(0,0,0,1.0))
