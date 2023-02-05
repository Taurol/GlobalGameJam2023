extends Sprite

var enemy_scene: PackedScene = preload("res://Scenes/Enemies/enemy.tscn")
var elite_scene: PackedScene = preload("res://Scenes/Enemies/Elite.tscn")
var mandiongus_scene: PackedScene = preload("res://Scenes/Enemies/Mandiongus.tscn")
var last_enemy
export (int) var enemy_damage = 10
export (int) var wait_time = 20 # en segundos
export (int) var dest_y = 1 # en segundos
export (int) var dest_x = 1 # en segundos
#export (Scene) var target_dst
#signals
signal enemy_spawned

func _ready():
	#$Timer.wait_time = wait_time
	#$Timer.start()
	pass # Replace with function body.

func spawn(enemy_type) -> void:
	if enemy_type == "Normal":
		spawn_normal()
		return
	if enemy_type == "Elite":
		spawn_elite()
		return
	
	spawn_boss()

func spawn_normal() -> void:
	var enemy = enemy_scene.instance()
	enemy.start(global_position, Vector2(dest_x, dest_y))
	get_tree().root.add_child(enemy)

func spawn_elite() -> void:
	var enemy = elite_scene.instance()
	enemy.start(global_position, Vector2(dest_x, dest_y))
	get_tree().root.add_child(enemy)

func spawn_boss() -> void:
	var enemy = mandiongus_scene.instance()
	enemy.start(global_position, Vector2(dest_x, dest_y))
	get_tree().root.add_child(enemy)

func _on_Timer_timeout():
	emit_signal("enemy_spawned", last_enemy)
	#spawn(global_position, Vector2(dest_x, dest_y), enemy_damage)

