extends Node2D

var move_direction = Vector2.UP
var move_speed = 100
var velocity = Vector2()
var life = 1500
var damage = 10

var can_move:bool = true

var attack_time: float = 2.0
var attack_ready: bool = true
var tower_in_attack_area = false
var towers_in_range: int = 0

var enemy_type

signal attack(dmg)

func _ready():
	$AttackTimer.wait_time = attack_time

func start(_position=position, _destiny = Vector2.UP, _enemy_type="Normal") -> void:
	position = _position
	var _direction = _destiny - _position
	move_direction = _direction.normalized()
	enemy_type = _enemy_type
	
func _process(delta):
	if can_move:
		position += move_direction*move_speed*delta
	
	if tower_in_attack_area and attack_ready:
		attack_ready = false
		play_attack_animation()
		emit_signal("attack", damage)
		$AttackTimer.start()
 
func _get_damage() -> int:
	return damage

func _on_HurtBox_area_entered(bullet) -> void:
	
	life -= bullet._get_damage()
	if life <= 0:
		queue_free()

func _on_AttackBox_area_entered(tower):
	towers_in_range += 1
	tower_in_attack_area = true
	connect("attack", tower, "recieve_damage")
	can_move = false

func _on_AttackBox_area_exited(tower):
	towers_in_range -= 1
	disconnect("attack", tower, "recieve_damage")
	
	if towers_in_range > 0:
		return
	
	tower_in_attack_area = false
	can_move = true

func _on_AttackTimer_timeout():
	attack_ready = true
	$AttackTimer.stop()

func play_attack_animation():
	
	print("Atacking")
