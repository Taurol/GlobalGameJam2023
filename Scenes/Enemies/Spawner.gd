extends Sprite


# Declare member variables here. Examples:
# var a = 2
export (int) var enemy_damage = 10
export (int) var wait_time = 5 # en segundos
export (int) var dest_y = 1 # en segundos
export (int) var dest_x = 1 # en segundos
#export (Scene) var target_dst
#signals
signal spawn_enemy


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = wait_time
	$Timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	emit_signal("spawn_enemy",global_position,Vector2(dest_x,dest_y),enemy_damage)
	pass # Replace with function body.
