extends Control

var enabled = false

signal exit_menu()


func _on_Back_pressed():
	hide()
	get_tree().paused = false
	emit_signal("exit_menu")

func show_menu():
	if !enabled:
		return
	get_tree().paused = true
	show()
	
	if MusicPlayer.volume_db < -50:
		$CenterContainer/VBoxContainer/HSlider.value = 0
		return
	$CenterContainer/VBoxContainer/Slider/HSlider.value = db2linear(MusicPlayer.volume_value)


func _on_HSlider_value_changed(value):
	var volume_db = linear2db(value)
	if value < 0.05:
		volume_db = -80
	
	MusicPlayer.volume_value = volume_db
	MusicPlayer.volume_db = volume_db


func _on_HSlider_mouse_exited():
	$CenterContainer/VBoxContainer/Slider/HSlider.release_focus()
