extends Sprite

var enemy_scene: PackedScene = preload("res://Scenes/Enemies/enemy.tscn")
var last_enemy
export (int) var enemy_damage = 10
export (int) var wait_time = 5 # en segundos
export (int) var dest_y = 1 # en segundos
export (int) var dest_x = 1 # en segundos
#export (Scene) var target_dst
#signals
signal spawn_enemy

func _ready():
	$Timer.wait_time = wait_time
	$Timer.start()
	pass # Replace with function body.

func spawn(enemy_pos, destination, enemy_damage) -> void:
	var enemy = enemy_scene.instance()
	enemy.start(enemy_pos, destination,enemy_damage)
	get_tree().root.add_child(enemy)
	
	last_enemy = enemy

func _on_Timer_timeout():
	emit_signal("enemy_spawned", last_enemy)
	spawn(global_position, Vector2(1920/2, 1080/2), enemy_damage)

