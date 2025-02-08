extends Node2D

const TARGET_Y = 164
const SPAWN_Y = -16
const DIST_TO_TARGET = TARGET_Y - SPAWN_Y

const LEFT_LANE_X = 400
const RIGHT_LANE_X = 700
const LEFT_LANE_SPAWN = Vector2(LEFT_LANE_X, SPAWN_Y)
const RIGHT_LANE_SPAWN = Vector2(RIGHT_LANE_X, SPAWN_Y)

const Y_LIMIT = 900

@export var speed : float = 1
var hit = false

var sprite : AnimatedSprite2D = null

@export var fade_speed = .3

var is_fading = false

var tween 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#tween.tween_property(self, "position", Vector2(200, 300), 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		





func _physics_process(delta):
	if hit:
		position.y += speed * delta
		if position.y > Y_LIMIT:
			queue_free()
	#else:
		#position.y -= speed * delta

# initialize prey in its lane
func initialize(lane):
	if lane == 0:
		sprite = $SquidSprite
		$FishSprite.visible = false
		position = LEFT_LANE_SPAWN
	elif lane == 1:
		sprite = $FishSprite
		$SquidSprite.visible = false
		position = RIGHT_LANE_SPAWN
	else:
		print("bad lane :[... ", lane)
		return
		
	sprite.play("default")
	tween = create_tween()
	tween.tween_property(self, "position", Vector2(position.x, 412), 1.94)
	tween.connect("finished", tween_done)
	speed = DIST_TO_TARGET / speed

func tween_done():
	print("efniesnfiowen")
	hit = true




func destroy():
	kill_fish()
	$Timer.start()
	hit = true
	tween.kill()


func kill_fish() -> void:
	sprite.play("explode")
	fade_sprite()
	
func fade_sprite() -> void:
	sprite.modulate.a -= fade_speed  # Decrease alpha value

	#if sprite.modulate.a <= 0:
		## Optionally hide or queue free the sprite when fully faded
		#sprite.visible = false

func _on_timer_timeout() -> void:
	queue_free()
	
