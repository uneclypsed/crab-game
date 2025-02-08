extends AudioStreamPlayer2D

var CrabRaveMusic = load("res://Assets/crab_rave_music.mp3")

# crab rave is 125 bpm
var bpm = 125


var song_position = 0.0
var song_position_in_beats = 1
var sec_per_beat = 60.0 / bpm
var last_reported_beat = 0
var beats_before_start = 0
var measure = 1


# Determining how close to the beat an event is
var closest = 0
var time_off_beat = 0.0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (CrabRaveMusic != null):
		if !is_playing():
			stream = CrabRaveMusic
			play()
