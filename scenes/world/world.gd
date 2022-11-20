extends Node
func get_class() -> String: return 'World'
# A template for gdscript classes following the Godot documentation style guide

#signal test_1

#enum test_2 {
#	test_3,
#}
#const TEST_4 = 1
@export var ui: NodePath
@export var guild_screen: NodePath
@export var combat_screen: NodePath
var time: float = 0
var last_full_second: int = 0
var _ui: Control
var _guild_screen: Control
var _combat_screen: Control
var _guild: Array[Unit]
@onready var onready = "onready"

func _init() -> void:
	pass

func _ready() -> void:
	_ui = get_node_or_null(ui)
	if !_ui: printerr('Path to UI node returned null | [%s]' % get_script())
	_guild_screen = get_node_or_null(guild_screen)
	if !_guild_screen: printerr('Path to GuildScreen node returned null | [%s]' % get_script())
	_combat_screen = get_node_or_null(combat_screen)
	if !_combat_screen: printerr('Path to CombatScreen node returned null | [%s]' % get_script())

	_guild = [get_node('Combat/Amazon')]



func _process(delta: float) -> void:
	if !Global.paused: _advance_time(delta)

func _physics_process(delta: float) -> void:
	pass

func public() -> void:
	pass

func _advance_time(delta: float) -> void:
	time += (delta * Global.time_scale)
	var fixed_to_second = int(time)

	if fixed_to_second > last_full_second:
		last_full_second = fixed_to_second
		Global.time.minutes += 1

		if Global.time.minutes >= 60:
			Global.time.hours += 1
			Global.time.minutes = 0
		if Global.time.hours >= 24:
			Global.date.day += 1
			Global.time.hours = 0
		if Global.date.day >= 31:
			if Global.date.season == "Summer": Global.date.season = "Autumn"
			if Global.date.season == "Autumn": Global.date.season = "Winter"
			if Global.date.season == "Winter": Global.date.season = "Spring"
			if Global.date.season == "Spring": Global.date.season = "Summer"
			Global.date.day = 1

		_ui.update_time_display()
		_ui.update_date_display()
		_ui.update_year_display()

