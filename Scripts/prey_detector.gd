extends Sprite2D

var perfect = false
var okay = false
var bad = false
var current_note = null


@export var input = "key_left"


func _input(event):
	if event.is_action_pressed(input, false) and current_note != null:
		current_note.destroy()
		print_quality()
		get_parent().update_score(get_quality())
			

func print_quality() -> void:
	if perfect:
		print("perfect!")
		$ExclamationSpawnPosition.spawn_exclaim(0)
	elif okay:
		print("ok...")
		$ExclamationSpawnPosition.spawn_exclaim(1)
	elif bad:
		print("ew you fuckin suck omg")
		$ExclamationSpawnPosition.spawn_exclaim(2)


func get_quality() -> int:
	if perfect:
		return 0
	elif okay:
		return 1
	elif bad:
		return 2
	return -1


func _reset() -> void:
	current_note = null
	perfect = false
	okay = false
	bad = false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_perfect_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("prey"):
		perfect = true
		if current_note == null:
			current_note = area


func _on_perfect_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("prey"):
		perfect = false


func _on_ok_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("prey"):
		okay = true
		if current_note == null:
			current_note = area


func _on_ok_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("prey"):
		okay = false
		


func _on_shit_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("prey"):
		current_note = area
		bad = true
		if current_note == null:
			current_note = area


func _on_shit_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("prey"):
		current_note = null
		bad = false
