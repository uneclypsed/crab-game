extends Node2D

@export var fade_speed = 3
@export var fall_speed = 300

var sprite : Sprite2D = null
var spawn_position = Vector2(0, 100)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func initialize(quality):
	#print("in!")
	if quality == 0:
		sprite = $Perfect
	elif quality == 1:
		sprite = $Nice
	elif quality == 2:
		sprite = $Okay
	sprite.visible = true
	
	#position = spawn_position
	
func _physics_process(delta):
	if sprite.modulate.a >= 0:
		position[1] += fall_speed*delta
		sprite.modulate.a -= fade_speed*delta
	else: 
		queue_free()
