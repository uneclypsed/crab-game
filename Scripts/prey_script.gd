extends Node2D

const TARGET_Y = 164
const SPAWN_Y = -16
const DIST_TO_TARGET = TARGET_Y - SPAWN_Y

const LEFT_LANE_X = 120
const RIGHT_LANE_X = 1000
const LEFT_LANE_SPAWN = Vector2(LEFT_LANE_X, SPAWN_Y)
const RIGHT_LANE_SPAWN = Vector2(RIGHT_LANE_X, SPAWN_Y)

const Y_LIMIT = 1000

var speed = 0
var hit = false

var sprite : AnimatedSprite2D = null



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _physics_process(delta):
	if !hit:
		position.y += speed * delta
		if position.y > Y_LIMIT:
			queue_free()
	else:
		$Node2D.position.y -= speed * delta

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
	
	speed = DIST_TO_TARGET / 2.0


func destroy():
	kill_fish()
	$Timer.start()
	hit = true


func kill_fish() -> void:
	$PreySprite.play("explode")

func _on_timer_timeout() -> void:
	queue_free()
	
