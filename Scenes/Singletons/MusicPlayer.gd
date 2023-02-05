extends AudioStreamPlayer


export(String) var menu_music = "res://Assets/Sounds/menu_music.wav"
export(String) var gameplay_music = "res://Assets/Sounds/gameplay_loop.wav"

var volume_value = -0.0
var now_playing: String = "Menu"

func _ready():
	volume_db = volume_value
	pause_mode = Node.PAUSE_MODE_PROCESS
	stream = load(menu_music)
	yield(get_tree().create_timer(0.5),"timeout")
	play()


func play_menu_music():
	if now_playing == "Menu":
		return
	now_playing = "Menu"
	transition(menu_music)


func play_gameplay_music():
	if now_playing == "Gameplay":
		return
	now_playing = "Gameplay"
	transition(gameplay_music)


func transition(transition_to):
	
	$Tween.interpolate_property(self,"volume_db", volume_db, -80, 1.0,Tween.TRANS_LINEAR)
	$Tween.start()
	yield($Tween,"tween_completed")
	stop()
	volume_db = volume_value
	stream = load(transition_to)
	yield(get_tree().create_timer(1.0),"timeout")
	play()
