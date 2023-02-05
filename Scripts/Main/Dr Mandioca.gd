extends Area2D

signal lose_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func recieve_damage(damage) -> void:
	print("Recibi daño")
	emit_signal("lose_game")
