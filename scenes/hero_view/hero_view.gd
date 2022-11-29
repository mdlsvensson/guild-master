class_name HeroView
extends HBoxContainer
func get_class() -> String: return "HeroView"

@export_node_path(Label) var power_value_label: NodePath
@export_node_path(Label) var brawn_value_label: NodePath
@export_node_path(Label) var finesse_value_label: NodePath
@export_node_path(Label) var agility_value_label: NodePath
@export_node_path(Label) var resolution_value_label: NodePath
@export_node_path(Label) var armor_value_label: NodePath
var _power_value_label: Label
var _brawn_value_label: Label
var _finesse_value_label: Label
var _agility_value_label: Label
var _resolution_value_label: Label
var _armor_value_label: Label

func _ready() -> void:
	_resolve_node_paths()

func set_data(data: Dictionary) -> void:
	pass

func _resolve_node_paths() -> void:
	_power_value_label = get_node_or_null(power_value_label)
	if !_power_value_label: printerr('Path to PowerValueLabel node returned null | [%s]' % get_script())
	_brawn_value_label = get_node_or_null(brawn_value_label)
	if !_brawn_value_label: printerr('Path to BrawnValueLabel node returned null | [%s]' % get_script())
	_finesse_value_label = get_node_or_null(finesse_value_label)
	if !_finesse_value_label: printerr('Path to FinesseValueLabel node returned null | [%s]' % get_script())
	_agility_value_label = get_node_or_null(agility_value_label)
	if !_agility_value_label: printerr('Path to AgilityValueLabel node returned null | [%s]' % get_script())
	_resolution_value_label = get_node_or_null(resolution_value_label)
	if !_resolution_value_label: printerr('Path to ResolutionValueLabel node returned null | [%s]' % get_script())
	_armor_value_label = get_node_or_null(armor_value_label)
	if !_armor_value_label: printerr('Path to ArmorValueLabel node returned null | [%s]' % get_script())
	
