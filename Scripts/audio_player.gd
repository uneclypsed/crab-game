extends AudioStreamPlayer2D

# Tracking all info about the current song
var title = ""
var duration = 0
var bpm = 0
var beats = 0
var measures = 0
var music = null

var current_timestamp = 0.0
var current_measure = 0
var current_beat = 0

var upbeats = 0
var spb = 0.0
var last_reported_beat = 0

# type, left, right, measure, beat, idk
var delay = 1
var notes = [
["hit", 1, 0, 2, 0, 0],
["hit", 1, 0, 2, 1, 0],
["hit", 1, 0, 2, 2, 0],
#["hit", 1, 1, 2, 3, 0],
["hit", 1, 0, 3, 0, 0],
["hit", 1, 1, 3, 1, 0],
["hit", 1, 1, 3, 2, 0],
#["hit", 1, 1, 3, 3, 0],
["hit", 1, 1, 4, 0, 0],
["hit", 1, 1, 4, 1, 0],
["hit", 1, 1, 4, 2, 0],
#["hit", 1, 1, 4, 3, 0],
["hit", 1, 1, 5, 0, 0],
["hit", 0, 0, 10000000000, 5, 0],

]


signal note(type, side, duration)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	autoplay = false
	#var parser = XMLParser.new()
	#parser.open("res://Assets/rhythms/crab_rave.xml")
	#if parser.read():
		#push_error("can't read rhythm file")
#
	#print(parser.get_current_line())

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
	upbeats = 4
	
	stream = music
	play()
	#speed = DIST_TO_TARGET * bpm / 60.0

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
	pass
	#if (music != null):
		#if !is_playing():
			#stream = music
			#play()


func _input(event):
	if event.is_action_pressed("space"):
		stop()
		finished.emit()




func _physics_process(_delta):
	if playing:
		current_timestamp = get_playback_position() + AudioServer.get_time_since_last_mix()
		current_timestamp -= AudioServer.get_output_latency()
		current_beat = int(floor(current_timestamp / spb)) + upbeats
		_report_beat()


func _report_beat():
	#print(current_beat)
	while current_beat >= notes.front()[3] * 4 + notes.front()[4]:
		#print("(measure, beat): ({0},{1})".format([current_measure, current_beat]))
		#print(notes)
		#get_tree().call_group("game_scene", "spawn_prey", 1, 0)
		if notes.size() > 1:
			var n = notes.pop_front()
			print("n: ", n)
			get_tree().call_group("game_scene", "spawn_prey", n[1], n[2])


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
