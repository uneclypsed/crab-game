extends Control

var totalScore
#var HighScore = $NewHighScoreOneLine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var Values = SceneSwitcher.get_param("UserInterfaceInput")
	totalScore = Values[5];
	var perfects = Values[2];
	var nices = Values[3];
	var okays = Values[4];
	var maximum = Values[6]
	$"Total Score".text = str(totalScore)
	$"Perfects Count".text = str(perfects)
	$"Nices Count".text = str(nices)
	$"Okays Count".text = str(okays)
	if(totalScore > maximum):
		$NewHighScoreOneLine.visible=true
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
