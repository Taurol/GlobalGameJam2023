extends Area2D

var is_on_tower: bool = false
var tower
var is_selected: bool = false
var is_injerting: bool = false

export(String, "Remolacha", "Zanahoria", "Nabo", "RemRem", "ZanZan", "NaboNabo", "RemNabo", "RemZan", "NaboZan" ) var injerto_type = "Remolacha" 

export var initial_position: Vector2 = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey:
		if !event.pressed:
			if event.scancode == KEY_ESCAPE:
				reset()

func _on_DropableInjert_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if !event.is_pressed():
			if is_selected:
				if is_on_tower:
					add_injert_to_zone()
				else:
					reset()
			else:
				is_selected = true

func _process(delta):
	if is_selected:
		position = get_global_mouse_position()

func _on_DropableInjert_area_entered(area):
	is_on_tower = true
	tower = area
	print("Dentro de torre")


func _on_DropableInjert_area_exited(area):
	if is_injerting:
		return
	is_on_tower = false
	tower = null
	print("Fuera de torre")

func reset() -> void:
	is_selected = false
	position = initial_position
	pass

func add_injert_to_zone() -> void:
	if tower == null:
		reset()
		return
	is_injerting = true
	print("Llegue aca")
	tower.add_injerto(injerto_type)
	queue_free()
	
