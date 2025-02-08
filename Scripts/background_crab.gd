extends Node2D

var is_squish = false
var squish_speed = .006
var og_squish = scale.y
var squish_limit = .2

var initial_x = -20
var x_speed = 10
var x_max = 1500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = initial_x
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta):
	scale.y -= squish_speed
	if og_squish - scale.y >= squish_limit:
		scale.y = og_squish
	position.y = -1 * (scale.y/2)
	
	scale.
