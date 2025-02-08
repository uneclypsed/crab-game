extends Node2D
#
#var crab_sprite = load("Crab")
#var audio_player = load("AudioStreamPlayer2D")
var prey = load("res://Scenes/Prey.tscn")
var prey_instance = null

var score : int = 0
var bpm = 125

var x_speed = 3


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
	if event.is_action_pressed("space"):
		$BackgroundCrabs.spawn_b_crab()


func spawn_prey(lane):
	prey_instance = prey.instantiate()
	prey_instance.initialize(lane)
	add_child(prey_instance)
	
	
func update_score(quality):
	if quality == 0:
		score += 10
	elif quality == 1:
		score += 3
	elif quality == 2:
		score += 1
	
	$ScoreBoard.text = "Score: " + str(score)
	
	
