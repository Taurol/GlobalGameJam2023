extends Area2D

var move_direction: Vector2 = Vector2.UP
var speed: int = 100
var damage: int = 5


func _process(delta):
	position += move_direction.normalized()*speed*delta

func _on_Bullet_area_entered(area):
	queue_free()

func _get_damage():
	return damage
