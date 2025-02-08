extends Node2D
#
#var crab_sprite = load("Crab")
#var audio_player = load("AudioStreamPlayer2D")
var prey = load("res://Scenes/Prey.tscn")
var prey_instance


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func _input(event):
	if event.is_action_pressed("key_left"):
		spawn_prey(0)
	if event.is_action_pressed("key_right"):
		spawn_prey(1)


func spawn_prey(lane):
	prey_instance = prey.instantiate()
	prey_instance.initialize(lane)
	add_child(prey_instance)
	
	
