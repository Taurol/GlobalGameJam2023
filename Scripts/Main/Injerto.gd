extends Area2D

var bullet_scene: PackedScene = preload("res://Scenes/Main/Bullet.tscn")

export var bullet_speed: int = 100
export var shooting_reload_time: float = 1.0

var shoot_loaded: bool = true
var shooting_direction: Vector2 = Vector2.UP

var enemy = null
var life: int = 100

signal died()

func _process(delta):
	$ReloadTimer.wait_time = shooting_reload_time
	
	if not(enemy == null):
		#return
		pass
	
	if shoot_loaded:
		shoot()

func shoot() -> void:
	shoot_loaded = false
	$ReloadTimer.start()
	
	var bullet = bullet_scene.instance()
	bullet.position = global_position
	bullet.move_direction = shooting_direction
	bullet.speed = bullet_speed
	
	get_tree().root.add_child(bullet)

func _on_ReloadTimer_timeout():
	$ReloadTimer.stop()
	shoot_loaded = true

func recieve_damage(damage) -> void:
	life -= damage
	
	print(life)
	if life <= 0:
		emit_signal("died")
		queue_free()

