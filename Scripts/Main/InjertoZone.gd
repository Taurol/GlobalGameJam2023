extends Area2D

export(Vector2) var shooting_direction= Vector2.UP
var injerto_scene: PackedScene = preload("res://Scenes/Main/Injerto.tscn")

var is_mouse_inside: bool = false
var has_child:bool = false
var life = 100

#export(String, "Remolacha", "Zanahoria", "Nabo", "RemRem", "ZanZan", "NaboNabo", "RemNabo", "RemZan", "NaboZan" ) var injerto_type = "Remolacha" 

func _on_InjertoZone_mouse_entered():
	if has_child:
		return
	is_mouse_inside = true
	$Sprite.self_modulate = Color.blue

func _on_InjertoZone_mouse_exited():
	if has_child:
		return
	is_mouse_inside = false
	$Sprite.self_modulate = Color.white

func _on_InjertoZone_input_event(viewport, event, shape_idx):
	if has_child:
		return
	
	if not(event is InputEventMouseButton):
		return
	
	if not is_mouse_inside:
		return
	
	var injerto = injerto_scene.instance()
	
	injerto.shooting_direction = shooting_direction
	injerto.connect("died", self, "injerto_died")
	#injerto.injerto_type = injerto_type
	injerto.initialize()
	add_child(injerto)
	has_child = true
	
	$Sprite.self_modulate = Color.gray


func injerto_died() -> void:
	has_child = false
	$Sprite.self_modulate = Color.white


func _on_InjertoZone_area_entered(area):
	if has_child:
		return
	is_mouse_inside = true
	$Sprite.self_modulate = Color.blue


func _on_InjertoZone_area_exited(area):
	if has_child:
		return
	is_mouse_inside = false
	$Sprite.self_modulate = Color.white


func add_injerto(injerto_type: String) -> void:
	if has_child:
		return
	
	if not is_mouse_inside:
		return
	
	var injerto = injerto_scene.instance()
	
	injerto.shooting_direction = shooting_direction
	injerto.connect("died", self, "injerto_died")
	injerto.injerto_type = injerto_type
	injerto.initialize()
	add_child(injerto)
	has_child = true
	
	$Sprite.self_modulate = Color.gray
