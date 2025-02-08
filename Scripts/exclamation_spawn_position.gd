extends Node2D

var exclaim = load("res://Scenes/Quality_Exclamation.tscn")
var exclaim_instance = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_exclaim(quality):
	add_child(exclaim_instance)
	exclaim_instance = exclaim.instantiate()
	exclaim_instance.initialize(quality)
	#exclaim_instance.position[1] = position
	
