extends AudioStreamPlayer2D

# Tracking all info about the current song
#var TrackInfo = {
var title = ""
var duration = 0
var bpm = 0
var beats = 0
var measures = 0
var music = null

var current_timestamp = 0.0
var current_measure = 0
var current_beat = 0

var upbeats = 10
var spb = 0.0
var last_reported_beat = 0

var notes = [
	["hit", 0, 1, 1, 0],
	["hit", 1, 2, 1, 1],
	["hit", 0, 2, 1, 1],
	["hit", 0, 3, 1, 0],
	["hit", 1, 3, 1, 0],
	["hit", 0, 4, 0, 1],
	["hit", 0, 5, 1, 0],
	["hit", 1, 5, 1, 0],
	["hit", 0, 6, 1, 0],
	["hit", 0, 7, 1, 0],
	["hit", 1, 7, 1, 0],
	["hit", 0, 8, 1, 0],
	["hit", 0, 9, 1, 0],
	["hit", 0, 10, 1, 0],
	["hit", 0, 11, 1, 0],
	["hit", 0, 12, 1, 0],
	["hit", 0, 13, 1, 0],
	["hit", 0, 14, 1, 0],
	["hit", 1, 14, 1, 0],
	["hit", 0, 15, 1, 0],
	["hit", 0, 16, 1, 0],
	["hit", 1, 16, 1, 0],
	["hit", 0, 17, 1, 0],
	["hit", 0, 18, 1, 0],
	["hit", 0, 19, 1, 0],
	["hit", 0, 19, 1, 0],
	["hit", 0, 20, 1, 0],
	["hit", 0, 21, 1, 0],
	["hit", 0, 22, 1, 0],
	["hit", 1, 22, 1, 0],
	["hit", 0, 23, 1, 0],
	["hit", 0, 24, 1, 0],
	["hit", 0, 25, 1, 0],
	["hit", 0, 26, 1, 0],
	["hit", 0, 27, 1, 0],
	["hit", 0, 28, 1, 0],
	["hit", 0, 29, 1, 0],
	["hit", 0, 30, 1, 0],
	["hit", 0, 31, 1, 0],
	["hit", 0, 32, 1, 0],
	["hit", 0, 33, 1, 0],
	["hit", 0, 34, 1, 0],
	["hit", 0, 35, 1, 0],
	["hit", 0, 36, 1, 0],
	["hit", 0, 37, 1, 0],
	["hit", 0, 38, 1, 0],
	["hit", 0, 39, 1, 0],
	["hit", 0, 40, 1, 0],
	["hit", 0, 41, 1, 0],
	["hit", 0, 42, 1, 0],
	["hit", 0, 43, 1, 0],
	["hit", 0, 44, 1, 0],
	["hit", 0, 45, 1, 0],
	["hit", 0, 46, 1, 0],
	["hit", 0, 47, 1, 0],
	["hit", 0, 48, 1, 0],
	["hit", 0, 49, 1, 0],
	["hit", 0, 50, 1, 0],
	["hit", 0, 51, 1, 0],
	["hit", 0, 52, 1, 0],
	["hit", 0, 53, 1, 0],
	["hit", 0, 54, 1, 0],
	["hit", 0, 55, 1, 0],
	["hit", 0, 56, 1, 0],
	["hit", 0, 57, 1, 0],
	["hit", 0, 58, 1, 0],
	["hit", 0, 59, 1, 0],
	["hit", 0, 60, 1, 0],
	["hit", 0, 61, 1, 0],
	["hit", 0, 62, 1, 0],
	["hit", 0, 63, 1, 0],
	["hit", 0, 64, 1, 0],
	["hit", 0, 65, 1, 0],
	["hit", 0, 66, 1, 0],
	["hit", 0, 67, 1, 0],
	["hit", 0, 68, 1, 0],
	["hit", 0, 69, 1, 0],
	["hit", 0, 70, 1, 0],
	["hit", 0, 71, 1, 0],
	["hit", 0, 72, 1, 0],
	["hit", 0, 73, 1, 0],
	["hit", 0, 74, 1, 0],
	["hit", 0, 75, 1, 0],
	["hit", 0, 76, 1, 0],
	["hit", 0, 77, 1, 0],
	["hit", 0, 78, 1, 0],
	["hit", 0, 79, 1, 0],
	["hit", 0, 80, 1, 0],
	["hit", 0, 81, 1, 0],
	["hit", 0, 82, 1, 0],
	["hit", 0, 83, 1, 0],
	["hit", 0, 84, 1, 0]
]
#} 

# Determining how close to the beat an event is
#var closest = 0
#var time_off_beat = 0.0

signal note(type, side, duration)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var parser = XMLParser.new()
	parser.open("res://Assets/rhythms/crab_rave.xml")
	if parser.read():
		push_error("can't read rhythm file")
		
	print(parser.get_current_line())
	
	# retrieve preliminary info from parent/header node
	music = load("res://Assets/sounds/crab_rave.mp3")
	title = "Crab Rave"
	duration = 244
	bpm = 125
	measures = 84
	beats = 336
	
	current_measure = 1
	current_beat = 1
	spb = 60.0 / bpm
	
	# parse beat timings
	#while parser.read() != ERR_FILE_EOF:
		#print("reading...")
		#if parser.get_node_name() == "note":
			#var new_note = { beat = 0, type = "", duration = 0 }
			#new_note["beat"] = parser.get_named_attribute_value("measure").to_int() * 4 
			#new_note["beat"] += parser.get_named_attribute_value("beat-start").to_int()
			#new_note["type"] = parser.get_named_attribute_value("type")
			#new_note["duration"] = parser.get_named_attribute_value("duration").to_int()
		#
			#notes.push_back(new_note)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (music != null):
		if !is_playing():
			stream = music
			play()


func _physics_process(_delta):
	if playing:
		current_timestamp = get_playback_position() + AudioServer.get_time_since_last_mix()
		current_timestamp -= AudioServer.get_output_latency()
		current_beat = int(floor(current_timestamp / spb)) + upbeats
		_report_beat()


func _report_beat():
	while current_beat == notes.front()[2] * 4 + notes.front()[3]:
		print("(measure, beat): ({0},{1})".format([current_measure, current_beat]))
		var n = notes.pop_front()
		#note.emit(n[0], n[1], n[4])
		get_tree().call_group("game_scene", "spawn_prey", n[1])


func play_with_beat_offset(num):
	upbeats = num
	$StartTimer.wait_time = spb
	$StartTimer.start()


#func closest_beat(nth):
	#closest = int(round((current_timestamp / spb) / nth) * nth) 
	#time_off_beat = abs(closest * spb - current_timestamp)
	#return Vector2(closest, time_off_beat)


func play_from_beat(beat, offset):
	print("here?")
	play()
	seek(beat * spb)
	upbeats = offset
	current_measure = beat % measures


func _on_StartTimer_timeout():
	current_beat += 1
	if current_beat < upbeats - 1:
		$StartTimer.start()
	elif current_beat == upbeats - 1:
		$StartTimer.wait_time = $StartTimer.wait_time - (AudioServer.get_time_to_next_mix() +
														AudioServer.get_output_latency())
		$StartTimer.start()
	else:
		play()
		$StartTimer.stop()
	_report_beat()
