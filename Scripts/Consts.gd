extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const injert_types = {
	REMOLACHA = "Remolacha",
	ZANAHORIA = "Zanahoria",
	NABO = "Nabo",
	REMREM = "RemRem",
	ZANZAN = "ZanZan",
	NABONABO = "NaboNabo",
	REMZAN = "RemZan",
	REMNABO = "RemNabo",
	NABOZAN = "NaboZan",
}

const injert_textures = {
	REMOLACHA_TEXTURE = preload("res://Assets/Sprites/Tuberculos/Remolacha.png"),
	ZANAHORIA_TEXTURE = preload("res://Assets/Sprites/Tuberculos/Zanahoria.png"),
	NABO_TEXTURE = preload("res://Assets/Sprites/Tuberculos/Nabo.png"),
	NABONABO_TEXTURE = preload("res://Assets/Sprites/Mutaciones/Nabo+Nabo.png"),
	ZANZAN_TEXTURE = preload("res://Assets/Sprites/Mutaciones/Zanahoria+Zanahoria.png"),
	REMREM_TEXTURE = preload("res://Assets/Sprites/Mutaciones/Remolacha+Remolacha.png"),
	REMNABO_TEXTURE = preload("res://Assets/Sprites/Mutaciones/Zanahoria+Nabo.png"),
	REMZAN_TEXTURE = preload("res://Assets/Sprites/Mutaciones/Zanahoria+Remolacha.png"),
	NABOZAN_TEXTURE = preload("res://Assets/Sprites/Mutaciones/Zanahoria+Nabo.png"),
}

const card_textures = {
	REMOLACHA_TEXTURE = preload("res://Assets/Sprites/Tarjetas/Tarj_Remolacha.png"),
	ZANAHORIA_TEXTURE = preload("res://Assets/Sprites/Tarjetas/Tarj_Zanahoria.png"),
	NABO_TEXTURE = preload("res://Assets/Sprites/Tarjetas/Tarj_Nabo.png"),
	NABONABO_TEXTURE = preload("res://Assets/Sprites/Mutaciones/Tarj_Nabo+Nabo.png"),
	ZANZAN_TEXTURE = preload("res://Assets/Sprites/Mutaciones/Tarj_Zanahoria+Zanahoria.png"),
	REMREM_TEXTURE = preload("res://Assets/Sprites/Mutaciones/Tarj_Remolacha+Remolacha.png"),
	REMNABO_TEXTURE = preload("res://Assets/Sprites/Mutaciones/Tarj_Zanahoria+Nabo.png"),
	REMZAN_TEXTURE = preload("res://Assets/Sprites/Mutaciones/Tarj_Remolacha+Zanahoria.png"),
	NABOZAN_TEXTURE = preload("res://Assets/Sprites/Mutaciones/Tarj_Zanahoria+Nabo.png"),
}

func get_card_texture(type: String):
	if type == injert_types.REMOLACHA:
		return card_textures.REMOLACHA_TEXTURE
	if type == injert_types.ZANAHORIA:
		return card_textures.ZANAHORIA_TEXTURE
	if type == injert_types.NABO:
		return card_textures.NABO_TEXTURE
	if type == injert_types.NABONABO:
		return card_textures.NABONABO_TEXTURE
	if type == injert_types.REMREM:
		return card_textures.REMREM_TEXTURE
	if type == injert_types.ZANZAN:
		return card_textures.ZANZAN_TEXTURE
	if type == injert_types.REMNABO:
		return card_textures.REMNABO_TEXTURE
	if type == injert_types.REMZAN:
		return card_textures.REMZAN_TEXTURE
	if type == injert_types.NABOZAN:
		return card_textures.NABOZAN_TEXTURE


func get_injert_texture(type: String):
	if type == injert_types.REMOLACHA:
		return injert_textures.REMOLACHA_TEXTURE
	if type == injert_types.ZANAHORIA:
		return injert_textures.ZANAHORIA_TEXTURE
	if type == injert_types.NABO:
		return injert_textures.NABO_TEXTURE
	if type == injert_types.NABONABO:
		return injert_textures.NABONABO_TEXTURE
	if type == injert_types.REMREM:
		return injert_textures.REMREM_TEXTURE
	if type == injert_types.ZANZAN:
		return injert_textures.ZANZAN_TEXTURE
	if type == injert_types.REMNABO:
		return injert_textures.REMNABO_TEXTURE
	if type == injert_types.REMZAN:
		return injert_textures.REMZAN_TEXTURE
	if type == injert_types.NABOZAN:
		return injert_textures.NABOZAN_TEXTURE
