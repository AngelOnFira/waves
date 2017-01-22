extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var fade_amount = 0.00001
var fade_reduce = 0.00001
var timer = null
const FLASH_START = 1

func get_Object(id):
	return get_node(id)

func _next_level(body):
	get_node("/root/GlobalController").set_scene("MainScene")

func _fixed_process(delta):
	#print(fade_amount)
	var s = get_node("Flash")
	if s.get_energy() > 0.01:
		s.set_energy(s.get_energy() - fade_amount)
		fade_amount += fade_reduce
		s.set_scale(Vector2(max(s.get_scale().x - fade_amount*15,0), max(0, s.get_scale().x - fade_amount*15)))
	#if s.get_scale().x > 0:
	#	s.set_scale(Vector2(s.get_scale().x - fade_amount, s.get_scale().y - fade_amount))
		
	

func flash():
	get_node("Flash").set_energy(FLASH_START)
	get_node("Flash").set_scale(Vector2(10,10))
	timer.stop()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	timer = Timer.new()
	timer.connect("timeout", self, "flash")
	timer.set_wait_time(1)
	add_child(timer)
	timer.start()
	print("Level 0 loaded")
