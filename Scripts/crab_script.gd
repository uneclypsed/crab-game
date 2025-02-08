extends AnimatedSprite2D

var og_pos = position
var is_walking = true
var x_speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = 5
	play('idle')


func _physics_process(delta):
	if is_walking:
<<<<<<< Updated upstream
=======
		print("LLL")
>>>>>>> Stashed changes
		position.x += x_speed * delta
		if position.x >= og_pos[0]:
			position = og_pos
			is_walking = false


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
