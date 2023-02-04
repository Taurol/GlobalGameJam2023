extends Control


func _on_ExitButton_pressed():
	hide()
	get_tree().paused = false

func show_menu():
	show()
	get_tree().paused = true

func _on_YesButton_pressed():
	get_tree().quit()


func _on_NoButton_pressed():
	hide()
	get_tree().paused = false
