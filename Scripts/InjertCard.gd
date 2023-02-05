extends TextureButton


var dropable_scene: PackedScene = preload("res://Scenes/Main/DropableInjert.tscn")
# Called when the node enters the scene tree for the first time.
var is_dropable_active: bool = false
export(String, "Remolacha", "Zanahoria", "Nabo", "RemRem", "ZanZan", "NaboNabo", "RemNabo", "RemZan", "NaboZan" ) var injert_type = "Remolacha" 

func _ready():
	texture_normal = Consts.get_card_texture(injert_type)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_InjertCard_button_up():
	is_dropable_active = true
	
	var dropable = dropable_scene.instance()
	dropable.position = get_global_mouse_position()
	dropable.injert_type = injert_type
	dropable.initialize()
	get_tree().root.add_child(dropable)
