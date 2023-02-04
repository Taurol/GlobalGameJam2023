extends Area2D

var move_direction: Vector2 = Vector2.UP
var moving: bool = false
var damage: int = 10

func _ready():
	pass # Replace with function body.

func shoot_in_direction(dir: Vector2) -> void:
	move_direction = dir
	moving = true
	

func _process(delta):
	if not moving:
		return
	
	

func _on_Bullet_area_entered(area):
	area.queue_free()

func _get_damage():
	return damage
