extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play('idle')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


var a_time = null
var b_time = null
var max_milliseconds = 20
var action_A = 'key_left'
var action_B = 'key_right'

func _input(event):
	#if !event.is_action_pressed(action_B):
		#b_time = null
	#if !event.is_action_pressed(action_A):
		#a_time = null
	var now = Time.get_ticks_msec()
	if event.is_action_pressed(action_A):
		if b_time != null:
			play("snap_both")
		else:
			play("snap_left")
			frame = 0
		a_time = now
		
	if event.is_action_released(action_A):
		a_time = null

	if event.is_action_pressed(action_B):
		if a_time != null:
			play("snap_both")
		else:
			play("snap_right")
			frame = 0

	b_time = now

	if event.is_action_released(action_B):
		b_time = null
	
	
	if !event.is_action_pressed(action_B):
		b_time = null
	if !event.is_action_pressed(action_A):
		a_time = null


func _on_animation_finished() -> void:
	play("idle")
