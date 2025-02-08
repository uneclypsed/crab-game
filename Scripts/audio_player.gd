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

var upbeats = 4
var spb = 0.0
var last_reported_beat = 0

var notes = []
#} 

# Determining how close to the beat an event is
#var closest = 0
#var time_off_beat = 0.0

signal note(type, duration)

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
	while parser.read() != ERR_FILE_EOF:
		print("reading...")
		if parser.get_node_name() == "note":
			var new_note = { beat = 0, type = "", duration = 0 }
			new_note["beat"] = parser.get_named_attribute_value("measure").to_int() * 4 
			new_note["beat"] += parser.get_named_attribute_value("beat-start").to_int()
			new_note["type"] = parser.get_named_attribute_value("type")
			new_note["duration"] = parser.get_named_attribute_value("duration").to_int()
		
			notes.push_back(new_note)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (music != null):
		if !is_playing():
			stream = music
			play()


<<<<<<< Updated upstream
#export var bpm := 100
#export var measures := 4
#
## Tracking the beat and song position
#var song_position = 0.0
#var song_position_in_beats = 1
#var sec_per_beat = 60.0 / bpm
#var last_reported_beat = 0
#var beats_before_start = 0
#var measure = 1
#
## Determining how close to the beat an event is
#var closest = 0
#var time_off_beat = 0.0
#
#signal beat(position)
#signal measure(position)


#func _ready():
	#sec_per_beat = 60.0 / bpm


#func _physics_process(_delta):
	#if playing:
		#song_position = get_playback_position() + AudioServer.get_time_since_last_mix()
		#song_position -= AudioServer.get_output_latency()
		#song_position_in_beats = int(floor(song_position / sec_per_beat)) + beats_before_start
		#_report_beat()


#func _report_beat():
	#if last_reported_beat < song_position_in_beats:
		#if measure > measures:
			#measure = 1
		#emit_signal("beat", song_position_in_beats)
		#emit_signal("measure", measure)
		#last_reported_beat = song_position_in_beats
		#measure += 1
#
#
#func play_with_beat_offset(num):
	#beats_before_start = num
	#$StartTimer.wait_time = sec_per_beat
	#$StartTimer.start()
#
#
#func closest_beat(nth):
	#closest = int(round((song_position / sec_per_beat) / nth) * nth) 
	#time_off_beat = abs(closest * sec_per_beat - song_position)
	#return Vector2(closest, time_off_beat)
#
#
#func play_from_beat(beat, offset):
	#play()
	#seek(beat * sec_per_beat)
	#beats_before_start = offset
	#measure = beat % measures


#func _on_StartTimer_timeout():
	#song_position_in_beats += 1
	#if song_position_in_beats < beats_before_start - 1:
		#$StartTimer.start()
	#elif song_position_in_beats == beats_before_start - 1:
		#$StartTimer.wait_time = $StartTimer.wait_time - (AudioServer.get_time_to_next_mix() +
														#AudioServer.get_output_latency())
		#$StartTimer.start()
	#else:
		#play()
		#$StartTimer.stop()
	#_report_beat()
=======
func _physics_process(_delta):
	if playing:
		current_timestamp = get_playback_position() + AudioServer.get_time_since_last_mix()
		current_timestamp -= AudioServer.get_output_latency()
		current_beat = int(floor(current_timestamp / spb)) + upbeats
		print("beat")
		_report_beat()


func _report_beat():
	print("we here")
	if current_beat == notes.front()["beat"]:
		var sig = notes.pop_front()
		print("NOTE!!!")
		note.emit(sig["type"], sig["duration"])


func play_with_beat_offset(num):
	upbeats = num
	$StartTimer.wait_time = spb
	$StartTimer.start()


#func closest_beat(nth):
	#closest = int(round((current_timestamp / spb) / nth) * nth) 
	#time_off_beat = abs(closest * spb - current_timestamp)
	#return Vector2(closest, time_off_beat)


func play_from_beat(beat, offset):
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
>>>>>>> Stashed changes
