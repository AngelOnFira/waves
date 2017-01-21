extends Node

var summon_timer = 3
var summon_countdown = 2

var move_timer = .2
var move_countdown = 0

var DefaultManager = preload("enemyMovement.gd")

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _fixed_process(delta):
	spawnEnemy(delta)
	
	var nodeGroup = get_tree().get_nodes_in_group("enemies")
	
	for i in nodeGroup:
		i.get_node("EnemyNode").moveEnemy()

func spawnEnemy(delta):
	summon_countdown -= delta
	if (summon_countdown <= 0):
		summon_countdown = summon_timer
		var enemy = preload("res://scenes/enemy.tscn").instance()
		var position = Vector2()
		enemy.set_pos(position)
		add_child(enemy)
		add_to_group("enemies")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
