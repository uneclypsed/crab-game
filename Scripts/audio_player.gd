extends AudioStreamPlayer2D

var CrabRaveMusic = load("res://Assets/crab_rave_music.mp3")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (CrabRaveMusic != null):
		if !is_playing():
			stream = CrabRaveMusic
			play()
