extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		#print("test1");
		if get_rect().has_point(to_local(event.position)):
			#print("test2");
			#var UserInterfaceNode = get_node("../../UserInterface/Control")
			##var UserInterfaceNode = get_tree().get_root().get_node("UserInterface");
			#queue_free();
			#get_tree().change_scene_to_file("res://Scenes/UserInterface.tscn")
			##$ButtonClick.play();
			#UserInterfaceNode.visible = false;
			#var simultaneous_scene = preload("res://Scenes/UserInterface.tscn").instantiate();
			#var currentNode = get_node("..");
			##
			#get_tree().root.add_child(simultaneous_scene);
			#get_tree().root.remove_child(self)
			#queue_free();
			#get_tree().change_scene_to_file("res://Scenes/UserInterface.tscn")
			var inputs = get_node("..").inputs
			inputs[6] = inputs[1][0][1]
			SceneSwitcher.change_scene("res://Scenes/UserInterface.tscn",{"UserInterfaceInput":inputs})
