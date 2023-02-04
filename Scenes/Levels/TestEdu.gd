extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var enemy_asset = "res://Scenes/Enemies/enemy.tscn"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Spawner_spawn_enemy(enemy_pos,destination,enemy_damage):
	print("posiition ",enemy_pos)
	var enemy = load(enemy_asset).instance()
	enemy.start(enemy_pos, destination,enemy_damage)
	add_child(enemy)
	#enemy._get_damage()
	pass # Replace with function body.
