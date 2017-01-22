extends Node2D
export var id = ""
var light_source
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	light_source = get_tree().get_current_scene().get_Object(id)
	
	pass
	
func _fixed_process(delta):
	#print(delta)
	#var space_rid = get_world_2d().get_space()
	var from = self.get_pos()
	var to   = light_source.get_pos()
	
	
	var space_state = get_world_2d().get_direct_space_state()
	var ray_dict    = space_state.intersect_ray(from,to)
	#if( not ray_dict.empty()):
		#if( id == ray_dict.collider.get_parent().get_name()):
			#print("colliding")
	
