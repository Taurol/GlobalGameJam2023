extends Area2D

var towers: Array

#export(String, "Remolacha", "Zanahoria", "Nabo", "RemRem", "ZanZan", "NaboNabo", "RemNabo", "RemZan", "NaboZan" ) var injerto_type = "Remolacha" 
var injert_type
export var initial_position: Vector2 = Vector2.ZERO

signal dropable_freed
signal tower_not_found


func _input(event):
	if event is InputEventKey:
		if !event.pressed:
			if event.scancode == KEY_ESCAPE:
				reset()

func _on_DropableInjert_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if not towers.empty():
				add_injert_to_zone()
			else:
				reset()


func _process(delta):
	position = get_global_mouse_position()

func initialize():
	$Root.texture = Consts.get_injert_texture(injert_type)

func _on_DropableInjert_area_entered(tower):
	towers.append(tower)
	print("Dentro de torre")


func _on_DropableInjert_area_exited(tower):
	towers.erase(tower)
	print("Fuera de torre")


func reset() -> void:
	emit_signal("dropable_freed")
	queue_free()

func add_injert_to_zone() -> void:
	if towers.empty():
		emit_signal("tower_not_found")
		reset()
		return
		
	print("Injerto Plantado")
	towers.pop_back().add_injerto(injert_type)
	queue_free()
