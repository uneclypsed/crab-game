extends Control

var inputs


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inputs = SceneSwitcher.get_param("UserInterfaceInput")
	print(inputs)
	var name = inputs[0]
	var score = inputs[5]
	var playerArray = inputs[1]
	
	playerArray = addScore(name, score, playerArray)
	
	inputs[1] = playerArray
	
	var Ps = [$P0,$P1,$P2,$P3,$P4,$P5,$P6,$P7,$P8,$P9]
	var Scores = [$P0/Score1,$P1/Score1,$P2/Score1,$P3/Score1,$P4/Score1,$P5/Score1,$P6/Score1,$P7/Score1,$P8/Score1,$P9/Score1]
	
	for i in len(playerArray):
		Ps[i].text = playerArray[i][0]
		Scores[i].text = str(playerArray[i][1])
	
	for i in (10 - len(playerArray)):
		Ps[i + len(playerArray)].text = "N/A"
		Scores[i + len(playerArray)].text = "N/A"
		
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func addScore(PlayerName: String, score:int, PlayerScores):
	if PlayerScores == []:
		return [[PlayerName, score]]
	
	var PlayerLength = len(PlayerScores)
		
	for i in PlayerLength:
		if PlayerScores[i][1] < score:
			PlayerScores.insert(i, [PlayerName, score]);
			if PlayerLength == 10:
				PlayerScores.remove_at(10);
			return PlayerScores
	
	if PlayerLength < 10:
		PlayerScores.append([PlayerName, score])
	
	return PlayerScores
