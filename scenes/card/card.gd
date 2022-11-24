class_name Card
extends PanelContainer

@export_node_path(TextureRect) var portrait: NodePath
@export_node_path(TextureButton) var ability_1: NodePath
@export_node_path(TextureButton) var ability_2: NodePath
@export_node_path(TextureButton) var ability_3: NodePath
@export_node_path(TextureButton) var ability_4: NodePath
var _portrait: TextureRect
var _ability_1: TextureButton
var _ability_2: TextureButton
var _ability_3: TextureButton
var _ability_4: TextureButton
var _unit: Unit

func _ready() -> void:
	_portrait = get_node_or_null(portrait)
	if !_portrait: printerr('Path to Portrait node returned null | [%s]' % get_script())

	_ability_1 = get_node_or_null(ability_1)
	if !_ability_1: printerr('Path to Ability1 node returned null | [%s]' % get_script())

	_ability_2 = get_node_or_null(ability_2)
	if !_ability_2: printerr('Path to Ability1 node returned null | [%s]' % get_script())

	_ability_3 = get_node_or_null(ability_3)
	if !_ability_3: printerr('Path to Ability1 node returned null | [%s]' % get_script())

	_ability_4 = get_node_or_null(ability_4)
	if !_ability_4: printerr('Path to Ability1 node returned null | [%s]' % get_script())

func set_unit(unit: Unit) -> void:
	_unit = unit
	name = _unit.get_name_for_node()
	_portrait.texture = _unit.get_portrait("128")
