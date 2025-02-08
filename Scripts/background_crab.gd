extends Node2D

var is_squish = false
var squish_speed = .004
var og_squish = scale.y
var og_y = randf_range(250, 450)
var squish_limit = .1
var y_comp = 1

var initial_x = -20
var x_speed = 3
var x_max = 1500
var crab = randi_range(1, 5)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
	#var my_random_number = rng.randf_range(-10.0, 10.0)



func initialize():
	position.y = og_y
	position.x = initial_x
	if crab == 1:
		$Crab1.visible = true
	elif crab == 2:
		$Crab2.visible = true
	elif crab == 3:
		$Crab3.visible = true
	elif crab == 4:
		$Crab4.visible = true
	elif crab == 5:
		$Crab5.visible = true
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta):
	scale.y -= squish_speed
	position.y += y_comp
	if og_squish - scale.y >= squish_limit:
		scale.y = og_squish
		position.y = og_y
	
	position.x += x_speed*delta
	
	if position.x >= x_max:
		queue_free()
