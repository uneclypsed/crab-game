extends Control

var PlayerScores;
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
	
func addScore(PlayerName: String, score:int):
	if score < minimumScore:
		return;
		
	for i in 10:
		if PlayerScores[i][1] < score:
			PlayerScores.insert(i, [PlayerName, str(score)]);
			if PlayerLength > 10:
				PlayerScores.remove_at(10);
			break;
	
func _on_line_edit_text_submitted(new_text: String) -> void:
	var simultaneous_scene = preload("res://Scenes/Gameplay.tscn").instantiate();
	currPlayerName = new_text;
	get_tree().root.add_child(simultaneous_scene);
	hide();
	
	
#func _physics_process(delta):
