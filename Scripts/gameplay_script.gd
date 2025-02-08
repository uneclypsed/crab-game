extends Node2D
#
#var crab_sprite = load("Crab")
#var audio_player = load("AudioStreamPlayer2D")
var prey = load("res://Scenes/Prey.tscn")
var prey_instance = null

var perfect = 0
var nice = 0
var okay = 0

var score : int = 0
var bpm = 125


var x_speed = 3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#func _input(event):
	#if event.is_action_pressed("key_left"):
		#spawn_prey(0)
	#if event.is_action_pressed("key_right"):
		#spawn_prey(1)
	#if event.is_action_pressed("space"):
		#$BackgroundCrabs.spawn_b_crab()


func test(str):
	print(str)



func spawn_prey(preyL, preyR):
	if preyL == 1:
		prey_instance = prey.instantiate()
		prey_instance.initialize(0)
		add_child(prey_instance)
	if preyR == 1:
		prey_instance = prey.instantiate()
		prey_instance.initialize(1)
		add_child(prey_instance)
	
	
func update_score(quality):
	if quality == 0:
		perfect += 1
		score += 10
	elif quality == 1:
		nice += 1
		score += 3
	elif quality == 2:
		okay += 1
		score += 1
	
	$ScoreBoard.text = "Score: " + str(score)
	
	


func _on_audio_stream_player_2d_finished() -> void:
	#var simultaneous_scene = preload("res://Scenes/GameOver.tscn").instantiate();
	#var currentNode = get_node("..");
	##
	#get_tree().root.add_child(simultaneous_scene);
	#get_tree().root.remove_child(self)
	
	#get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
	var previous = SceneSwitcher.get_param("UserInterfaceInput")
	var values = [previous[0],previous[1],perfect, nice, okay, score, previous[6]]
	SceneSwitcher.change_scene("res://Scenes/GameOver.tscn",{"UserInterfaceInput":values})

	#currentNode.queue_free();
