extends Node2D


var b_crab = load("res://Scenes/Background_Crab.tscn")
var b_crab_instance = null

func _ready() -> void:
	$Timer.start(randf_range(1, 2))



func _process(delta: float) -> void:
	pass

func spawn_b_crab():
	b_crab_instance = b_crab.instantiate()
	b_crab_instance.initialize()
	b_crab_instance.x_speed = randf_range(100, 400)
	add_child(b_crab_instance)


func _on_timer_timeout() -> void:
	spawn_b_crab()
	$Timer.start(randf_range(1, 3))
