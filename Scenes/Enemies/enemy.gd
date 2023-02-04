extends Node2D

var move_direction = Vector2.UP
var move_speed = 100
var velocity = Vector2()
var life = 100
var damage = 10

func start(_position=position,_direction = Vector2.UP, _damage=10) -> void:
	position = _position
	move_direction = _direction.normalized()*move_speed
	damage = _damage

func _process(delta):
	position += move_direction*delta
	pass

func _get_damage() -> int:
	return damage

func _on_HurtBox_area_entered(bullet) -> void:
	life -= bullet._get_damage()
	if life <= 0:
		queue_free()
