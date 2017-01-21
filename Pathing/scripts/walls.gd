extends TileMap

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func spawnWalls():
	for i in range(40):
		print("test")
		var wall = preload("res://scenes/wall.tscn").instance()
		var position = Vector2()
		position.x = int(rand_range(0, 32)) * 32
		position.y = int(rand_range(0, 18)) * 32
		wall.set_pos(position)
		add_child(wall)
		
		

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	randomize()
	spawnWalls()
