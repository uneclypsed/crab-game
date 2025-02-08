extends Node

var _params = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_scene(next_scene, params=null):
	_params = params
	get_tree().change_scene_to_file(next_scene)
	
func get_param(name):
	if _params != null and _params.has(name):
		return _params[name]
	return null
