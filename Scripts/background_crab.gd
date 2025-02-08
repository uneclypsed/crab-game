extends Node2D

var is_squish = false
var squish_speed = .004
var og_squish = scale.y
var og_y = randf_range(250, 450)
var squish_limit = .1
var y_comp = 100
var og_skew = 0
var skew_dir = 1

@onready var p0 = $p0.position
@onready var p1 = $p1.position
@onready var p2 = $p2.position


var time = 0
var bounce_speed = 2.2


var initial_x = -20
var x_speed = 3
var x_max = 1500
var y_speed = 3






# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
	#var my_random_number = rng.randf_range(-10.0, 10.0)







func initialize():
	position.y = og_y
	position.x = initial_x
	randomize()
	var children = get_children()
	var tilemap = children[randi() % children.size()]
	tilemap.set_visible(true)
	


func bezier(t):
	var q0 = p0.lerp(p1, t)
	var q1 = p2.lerp(p2, t)
	var r = q0.lerp(q1, t)
	return r

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta):
<<<<<<< Updated upstream
	position.y = bezier(time).y+og_y
	scale.x = og_squish + (bezier(time).y)*.003
	time += delta*bounce_speed
	if time > 1:
		time = 0

=======
	scale.y -= squish_speed
	position.y += y_comp
	if og_squish - scale.y >= squish_limit:
		scale.y = og_squish
		position.y = og_y
	
>>>>>>> Stashed changes
	position.x += x_speed*delta
	
	if position.x >= x_max:
		queue_free()
