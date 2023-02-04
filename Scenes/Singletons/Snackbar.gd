extends CenterContainer

export(float) var show_duration = 3.0
export(float) var appear_duration = 0.5
export(float) var disappear_duration = 2.0

var tweens_executed = false

signal queued()

func _init():
	modulate = Color.transparent

func _ready():
	$Tween.interpolate_property(self, "modulate", modulate, Color.white, appear_duration,Tween.TRANS_LINEAR)
	$Tween.start()
	
	$Timer.wait_time = show_duration
	$Timer.one_shot =true
	$Timer.start()

func set_text(text: String) -> void:
	$TextureRect/Label.text = text

func _on_Tween_tween_completed(_object, _key):
	if not tweens_executed:
		return
	emit_signal("queued")
	queue_free()

func _on_Timer_timeout():
	$Tween.interpolate_property(self, "modulate", modulate, Color.transparent, disappear_duration,Tween.TRANS_LINEAR)
	$Tween.start()
	tweens_executed = true
