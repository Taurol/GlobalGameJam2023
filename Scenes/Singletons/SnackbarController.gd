extends Control


var snackbar_scene: PackedScene = preload("res://Scenes/Singletons/Snackbar.tscn")

var snackbar_counter: int = 0
var snackbar_array = []

var test_counter = 0

func add_snackbar(text: String) -> void:
	if snackbar_array.size() >= 3:
		snackbar_array.pop_front().queue_free()
	
	var node = snackbar_scene.instance()
	node.set_text(text)
	$SnackbarLayer/VBoxContainer.add_child(node)
	
	node.connect("queued",self, "snackbar_queued")
	
	snackbar_array.append(node)

func snackbar_queued() -> void:
	snackbar_array.pop_front()
