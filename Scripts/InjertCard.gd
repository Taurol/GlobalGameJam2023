extends TextureButton


var dropable_scene: PackedScene = preload("res://Scenes/Main/DropableInjert.tscn")
# Called when the node enters the scene tree for the first time.
var is_dropable_active: bool = false

export(String, "Remolacha", "Zanahoria", "Nabo", "RemRem", "ZanZan", "NaboNabo", "RemNabo", "RemZan", "NaboZan" ) var injert_type = "Remolacha" 
export var reload_time: float = 5.0

var loaded: bool = false
var time_left
func _ready():
	$ReloadTimer.wait_time = reload_time
	texture_normal = Consts.get_card_texture(injert_type)
	$ReloadTimer.start()

func _process(delta):
	if loaded:
		return
	
	$Label.text = "Recargando\n" + str($ReloadTimer.time_left)
	

func _on_InjertCard_button_up():
	if not loaded:
		return
	
	is_dropable_active = true
	
	var dropable = dropable_scene.instance()
	dropable.position = get_global_mouse_position()
	dropable.injert_type = injert_type
	dropable.initialize()
	get_tree().root.add_child(dropable)
	
	$ReloadTimer.start()
	loaded = false
	$Label.show()
	$Opacity.show()


func _on_ReloadTimer_timeout():
	$ReloadTimer.stop()
	loaded = true
	$Opacity.hide()
	$Label.hide()
	
