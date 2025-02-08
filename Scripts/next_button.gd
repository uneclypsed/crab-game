extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			var score = get_node("..").totalScore
			#print(score)
			#var simultaneous_scene = preload("res://Scenes/Leaderboard.tscn").instantiate();
			#var currentNode = get_node("..");
			#currentNode.queue_free();
			#get_tree().root.add_child(simultaneous_scene);
			#var simultaneous_scene = preload("res://Scenes/Leaderboard.tscn").instantiate();
			#var currentNode = get_node("..");
			##
			#get_tree().root.add_child(simultaneous_scene);
			#get_tree().root.remove_child(self)
			#queue_free();
			#var input = SceneSwitcher.get_params("UserInterfaceInput")
#			
			#SceneSwitcher.change_scene("res://Scenes/Leaderboard.tscn",{"UserInterfaceInput":score})
			#get_node("res://Scenes/GameOver.tcsn/NewHighScoreOneLine").visible = false
			get_tree().change_scene_to_file("res://Scenes/Leaderboard.tscn")
