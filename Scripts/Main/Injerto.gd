extends Area2D

var bullet_scene: PackedScene = preload("res://Scenes/Main/Bullet.tscn")

export var shooting_reload_time: float = 1.0
export var bullet_dmg: int = 5

var shoot_loaded: bool = true
var shooting_direction: Vector2 = Vector2.UP

var enemy = null
var life: int = 100
var injert_type

var type_data: Dictionary

signal died()

func initialize():
	read_properties()
	life = type_data[injert_type].hp
	shooting_reload_time = type_data[injert_type].reload
	bullet_dmg = type_data[injert_type].dmg
	
	$Sprite.texture = Consts.get_injert_texture(injert_type)
	print(injert_type)

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
	bullet.damage = bullet_dmg
	
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

func read_properties() -> void:
	var file = File.new()
	file.open("res://Assets/Config/Towers.json", File.READ)
	var data = parse_json(file.get_as_text())
	type_data = data
