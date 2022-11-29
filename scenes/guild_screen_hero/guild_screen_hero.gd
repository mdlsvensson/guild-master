class_name GuildScreenHero
extends TextureButton

signal hero_pressed(hero)

var _hero: Unit

func _ready() -> void:
	var error_1 = pressed.connect(func() -> void: emit_signal("hero_pressed", _hero))
	if error_1: printerr("There was an error connecting guild_screen_hero 'pressed' signal in %s" % get_script())

func set_hero(hero: Unit) -> void: _hero = hero

func get_hero() -> Unit: return _hero

