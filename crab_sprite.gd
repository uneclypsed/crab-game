extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play('idle')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#
#func _input(ev):
	#if Input.is_action_just_pressed("key_left"):
		#play("snap_left")
	#if Input.is_action_just_pressed("key_right"):
		#play("snap_right")
	#if Input.is_action_just_pressed("key_right") and Input.is_action_just_pressed("key_left"):
		#play("snap_both")
	##var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	##
	##if Input.is_action_just_pressed("key_left") || Input.is_action_just_pressed("key_right"):
		##if 



var a_time = null
var b_time = null
var max_milliseconds = 100
var action_A = 'key_left'
var action_B = 'key_right'

func _input(event):
	var now = Time.get_ticks_msec()
	if event.is_action_pressed(action_A):
		if b_time != null:
			play("snap_both")
		else:
			play("snap_left")
			
		a_time = now
		
	if event.is_action_released(action_A):
		a_time = null

	if event.is_action_pressed(action_B):
		if a_time != null:
			play("snap_both")
		else:
			play("snap_right")

	b_time = now

	if event.is_action_released(action_B):
		b_time = null


func _on_animation_finished() -> void:
	play("idle")
