extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("test1");
		if get_rect().has_point(to_local(event.position)):
			print("test2");
			var simultaneous_scene = preload("res://Scenes/Leaderboard.tscn").instantiate();
			get_tree().root.add_child(simultaneous_scene);
			var currentNode = get_node("..");
			currentNode.visible = false;
