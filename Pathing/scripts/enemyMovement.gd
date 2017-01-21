extends Node2D

var position = Vector2()
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#func _fixed_process(delta):
	#moveEnemies()
	
func moveEnemy():
	var playerPos = get_node("player").get_pos()
	#move_countdown -= delta
	if (position.x < playerPos.x):
		position.x += 1
	else:
		position.x -= 1
		
	if (position.y < playerPos.y):
		position.y += 1
	else:
		position.y -= 1
	set_pos(position)
	#position += Vector2(rand_range(-3, 2), rand_range(-3, 2))
	#get


func _ready():
	position.x = int(rand_range(0, 32)) * 32
	position.y = int(rand_range(0, 18)) * 32
	set_pos(position)
	# Called every time the node is added to the scene.
	# Initialization here
	#set_fixed_process(true)