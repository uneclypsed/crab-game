extends Control

var PlayerScores=[];
var PlayerLength = 0;
var currPlayerName;
var minimumScore = -1;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_button_pressed(input:String):
	pass
	
	
func _on_line_edit_text_submitted(new_text: String) -> void:
	#var simultaneous_scene = preload("res://Scenes/Gameplay.tscn").instantiate();
	#currPlayerName = new_text;
	#get_tree().root.add_child(simultaneous_scene);
	#hide();
	
	#get_tree().change_scene_to_file("res://Scenes/Gameplay.tscn")
	var UserInput = SceneSwitcher.get_param("UserInterfaceInput")
	if UserInput == null:
		UserInput = [new_text, PlayerScores, 0, 0, 0, 0, -1]
	else:
		UserInput = [new_text, UserInput[1], 0, 0, 0, 0, UserInput[1][0][1]]
	SceneSwitcher.change_scene("res://Scenes/Gameplay.tscn",{"UserInterfaceInput":UserInput});
	
	
#func _physics_process(delta):
