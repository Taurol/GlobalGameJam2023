extends Area2D

var bullet: PackedScene = preload("res://Scenes/Main/Bullet.tscn")
var shootin_reload: float = 1.0
var shoot_loaded: bool = true
var shooting_direction: Vector2 = Vector2.UP
var enemy = null

func _ready():
	
	pass # Replace with function body.

func _process(delta):
	if enemy == null:
		return
	
	if shoot_loaded:
		shoot()

func shoot() -> void:
	shoot_loaded = false
	$ReloadTimer.start()
	
	


func _on_ReloadTimer_timeout():
	$ReloadTimer.stop()
	shoot_loaded = true

