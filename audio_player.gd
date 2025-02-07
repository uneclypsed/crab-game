extends AudioStreamPlayer2D

var CrabRaveMusic = preload("res://crab_rave_music.mp3")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !$AudioStreamPlayer2D.is_playing():
		$AudioStreamPlayer2D.stream = CrabRaveMusic
		$AudioStreamPlayer2D.play()
