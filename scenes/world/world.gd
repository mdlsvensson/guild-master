extends Node2D
func get_class() -> String: return "World"
# A template for gdscript classes following the Godot documentation style guide

@export_node_path(Control) var ui: NodePath
@export_node_path(Control) var guild_screen: NodePath
@export_node_path(Control) var combat_screen: NodePath
var time: float = 0
var last_full_second: int = 0
var _ui: Control
var _guild_screen: Control
var _combat_screen: Control
var _guild: Array[Unit]
var _screens: Array[Control]

func _ready() -> void:
	_ui = get_node_or_null(ui)
	if !_ui: printerr('Path to UI node returned null | [%s]' % get_script())
	_guild_screen = get_node_or_null(guild_screen)
	if !_guild_screen: printerr('Path to GuildScreen node returned null | [%s]' % get_script())
	_combat_screen = get_node_or_null(combat_screen)
	if !_combat_screen: printerr('Path to CombatScreen node returned null | [%s]' % get_script())

	var error_1 = _ui.screen_change.connect(_on_screen_change)
	if error_1: printerr("There was an error connecting _ui 'screen_change' signal in %s" % get_script())

	var heroes = [Amazon.new(), Lifestealer.new()]

	_screens.append(_guild_screen)
	_screens.append(_combat_screen)
	_guild.append_array(heroes)


	for unit in _guild:
		var guild_screen_hero = preload("res://scenes/guild_screen_hero/guild_screen_hero.tscn").instantiate()
		guild_screen_hero.texture_normal = unit.get_portrait("64")
		_guild_screen.add_card_to_flow(guild_screen_hero)
		guild_screen_hero.set_hero(unit)

		var error_2 = guild_screen_hero.hero_pressed.connect(_on_guild_screen_hero_hero_pressed)
		if error_2: printerr("There was an error connecting guild_screen_hero 'hero_pressed' signal in %s" % get_script())

		var card = preload("res://scenes/card/card.tscn").instantiate()
		_combat_screen.add_child(card)
		card.set_unit(unit)

func _process(delta: float) -> void:
	if !Global.paused: _advance_time(delta)

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

func _on_screen_change() -> void:
	for screen in _screens:
		screen.hide()
	match Global.screen:
		Global.screens.GUILD: _guild_screen.show()
		Global.screens.COMBAT: _combat_screen.show()

func _on_guild_screen_hero_hero_pressed(hero: Unit) -> void:
	pass
