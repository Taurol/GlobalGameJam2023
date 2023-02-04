extends Control

var options = preload("res://Scenes/InGameOptions.tscn")

func _ready():
	$ExitGame.visible = false
	
	MusicPlayer.play_menu_music()

func _on_NewGame_pressed():
	#SceneSwitcher.change_scene("res://Scenes/FirstScene.tscn",{})
	SnackbarController.add_snackbar("Hola como estan")

func _on_Continue_pressed():
	SceneSwitcher.change_scene("res://Scenes/FirstScene.tscn", {})

func _on_ExitGame_pressed():
	$ExitGame.show_menu()
	get_tree().paused = true

func _on_Opciones_pressed():
	var node = options.instance()
	add_child(node)
	node.enabled = true
	node.show_menu()

func _on_ExitButton_pressed():
	get_tree().quit()
