extends Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start(randf_range(1,2))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timeout() -> void:
	start(randf_range(1,2))
