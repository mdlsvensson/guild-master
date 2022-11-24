class_name HeroViewItem
extends TextureButton

signal item_pressed(item)

var _item: Unit

func _ready() -> void:
	var error_1 = pressed.connect(_on_hero_view_item_pressed)
	if error_1: printerr("There was an error connecting hero_view_item 'pressed' signal in %s" % get_script())

func set_item(item: Item) -> void: _item = item

func get_hero() -> Unit: return _item

func _on_hero_view_item_pressed() -> void: emit_signal("item_pressed", _item)
