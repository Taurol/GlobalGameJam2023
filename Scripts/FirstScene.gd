extends Node2D

var win_scene: PackedScene = preload("res://Scenes/Main/WinScreen.tscn")
var lose_scene: PackedScene = preload("res://Scenes/Main/LoseScreen.tscn")

export var left_spawner_path: NodePath
onready var left_spawner := get_node(left_spawner_path)
export var right_spawner_path: NodePath
onready var right_spawner := get_node(right_spawner_path)
export var mid_spawner_path: NodePath
onready var mid_spawner := get_node(mid_spawner_path)

export var normal_waves_amount: int = 1
var enemies_per_elite: int = 20
var normal_waves_counter: int = 0
var normal_enemies_counter: int = 0

var start_timer: Timer
var wave_timer: Timer
var new_wave_timer: Timer
var enemy_spawn_timer: Timer

export var start_timer_duration: float = 10.0
export var wave_duration: float = 60.0
export var new_wave_wait_time: float = 180.0
export var enemy_spawn_time: float = 3.0
export var normal_spawn_probability: float = 0.3
export var elite_enemy_chance: float = 0.6

var is_in_wave: bool = false
var gameplay_started: bool = false
var boss_spawned: bool = false

var rng = RandomNumberGenerator.new()

var game_over: bool = false

var last_wave: bool = false
func _ready():
	MusicPlayer.play_gameplay_music()
	rng.randomize()
	
	start_timer = Timer.new()
	start_timer.connect("timeout",self,"_on_start_timer_timeout")
	start_timer.wait_time = start_timer_duration
	add_child(start_timer)
	
	wave_timer = Timer.new()
	wave_timer.connect("timeout",self,"_on_wave_timer_timeout")
	wave_timer.wait_time = wave_duration
	add_child(wave_timer)
	
	new_wave_timer = Timer.new()
	new_wave_timer.connect("timeout",self,"_on_new_wave_timer_timeout")
	new_wave_timer.wait_time = new_wave_wait_time
	add_child(new_wave_timer)
	
	enemy_spawn_timer = Timer.new()
	enemy_spawn_timer.connect("timeout",self,"_on_enemy_spawn_timer_timeout")
	enemy_spawn_timer.wait_time = enemy_spawn_time
	enemy_spawn_timer
	add_child(enemy_spawn_timer)
	
	SnackbarController.add_snackbar("Bienvenido")
	start_timer.start()


func spawn_controller() -> void:
	if normal_waves_amount == normal_waves_counter && not boss_spawned:
		boss_spawn()
		boss_spawned = true
		enemy_spawn_timer.stop()
		last_wave = true
		
	
	if is_in_wave:
		wave_spawn()
		return
	
	normal_spawn()

func you_win() -> void:
	new_wave_timer.stop()
	wave_timer.stop()
	enemy_spawn_timer.stop()
	
	var child_nodes = get_tree().root.get_children()
	
	for child in child_nodes:
		if child.is_in_group("Enemy"):
			child.queue_free()
	#TODO THINGS
	var win_node = win_scene.instance()
	$CanvasLayer.add_child(win_node)

func you_lose() -> void:
	
	if game_over:
		return
	var child_nodes = get_tree().root.get_children()
	
	for child in child_nodes:
		if child.is_in_group("Enemy"):
			child.queue_free()
	
	new_wave_timer.stop()
	wave_timer.stop()
	enemy_spawn_timer.stop()
	
	var lose_node = lose_scene.instance()
	$CanvasLayer.add_child(lose_node)

func wave_spawn() -> void:
	spawn_enemy()

func normal_spawn() -> void:
	var spawn_chance = rng.randf()
	if spawn_chance < normal_spawn_probability:
		spawn_enemy()
	

func boss_spawn() -> void:
	SnackbarController.add_snackbar("Llego el Mandiongus")
	mid_spawner.spawn("Mandiogus")
	

func _on_start_timer_timeout() -> void:
	start_timer.stop()
	gameplay_started = true
	new_wave_timer.start()
	enemy_spawn_timer.start()
	SnackbarController.add_snackbar("Atacan las mandiocas")

func _on_wave_timer_timeout() -> void:
	if last_wave:
		return
	
	is_in_wave = false
	new_wave_timer.start()
	normal_waves_counter += 1
	SnackbarController.add_snackbar("Termino la oleada")

func _on_new_wave_timer_timeout() -> void:
	is_in_wave = true
	wave_timer.start()
	new_wave_timer.stop()
	SnackbarController.add_snackbar("Viene una oleada!!")

func _on_enemy_spawn_timer_timeout() -> void:
	spawn_controller()

func spawn_enemy() -> void:
	normal_enemies_counter += 1
	if normal_enemies_counter%enemies_per_elite == 0:
		elite_spawn()
		return
	
	var side_picker = rng.randf()
	
	if side_picker< 0.5:
		left_spawner.spawn("Normal")
		return
	
	right_spawner.spawn("Normal")
	

func elite_spawn() -> void:
	var side_picker = rng.randf()
	
	if side_picker< 0.5:
		left_spawner.spawn("Elite")
		return
	
	right_spawner.spawn("Elite")
	return 

func _on_Dr_Mandioca_lose_game():
	you_lose()
	game_over = true

func _on_mandiogus_die():
	you_win()
