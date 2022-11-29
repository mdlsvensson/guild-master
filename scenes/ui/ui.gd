extends Control
func get_class() -> String: return 'UI'

signal screen_change

@export_node_path(TextureButton) var play_pause_button: NodePath
@export_node_path(TextureButton) var fast_forward_button: NodePath
@export_node_path(Label) var time_display: NodePath
@export_node_path(Label) var date_display: NodePath
@export_node_path(Label) var year_display: NodePath
@export_node_path(Button) var guild_button: NodePath
@export_node_path(Button) var combat_button: NodePath
@export_node_path(TextureButton) var back_button: NodePath
@export_node_path(TextureButton) var forward_button: NodePath
@export_node_path(PanelContainer) var view_1: NodePath
@export_node_path(PanelContainer) var view_2: NodePath
@export_node_path(PanelContainer) var view_3: NodePath
@export_node_path(Control) var views: NodePath
var _play_pause_button: TextureButton
var _fast_forward_button: TextureButton
var _time_display: Label
var _date_display: Label
var _year_display: Label
var _combat_button: Button
var _guild_button: Button
var _back_button: TextureButton
var _forward_button: TextureButton
var _view_1: PanelContainer
var _view_2: PanelContainer
var _view_3: PanelContainer
var _views: Control

func _ready() -> void:
	_resolve_node_paths()
	_signals()

func update_time_display() -> void:
	var hour_string: String
	var minute_string: String

	if Global.time.hours <= 9: hour_string = "0" + str(Global.time.hours)
	else: hour_string = str(Global.time.hours)
	if Global.time.minutes <= 9: minute_string = "0" + str(Global.time.minutes)
	else: minute_string = str(Global.time.minutes)

	_time_display.text = hour_string + ':' + minute_string

func update_date_display() -> void:
	var date_string: String

	if Global.date.day == 1 or Global.date.day == 21:
		date_string = str(Global.date.day) + "st of " + Global.date.season
	elif Global.date.day == 2 or Global.date.day == 22:
		date_string = str(Global.date.day) + "nd of " + Global.date.season
	elif Global.date.day == 3 or Global.date.day == 23:
		date_string = str(Global.date.day) + "rd of " + Global.date.season
	else: date_string = str(Global.date.day) + "th of " + Global.date.season

	_date_display.text = date_string

func update_year_display() -> void: _year_display.text = "Year " + str(Global.date.year)
	
func get_views() -> Array: return _views.get_children()

func _resolve_node_paths() -> void:
	_play_pause_button = get_node_or_null(play_pause_button)
	if !_play_pause_button: printerr('No valid path to PlayPauseButton node | [%s]' % get_script())
	_fast_forward_button = get_node_or_null(fast_forward_button)
	if !_fast_forward_button: printerr('No valid path to FastForwardButton node | [%s]' % get_script())
	_time_display = get_node_or_null(time_display)
	if !_time_display: printerr('No valid path to TimeDisplay node | [%s]' % get_script())
	_date_display = get_node_or_null(date_display)
	if !_date_display: printerr('No valid path to DateDisplay node | [%s]' % get_script())
	_year_display = get_node_or_null(year_display)
	if !_year_display: printerr('No valid path to YearDisplay node | [%s]' % get_script())

	_combat_button = get_node_or_null(combat_button)
	if !_combat_button: printerr('No valid path to CombatButton node | [%s]' % get_script())
	_guild_button = get_node_or_null(guild_button)
	if !_guild_button: printerr('No valid path to GuildButton node | [%s]' % get_script())

	_back_button = get_node_or_null(back_button)
	if !_back_button: printerr('No valid path to BackButton node | [%s]' % get_script())
	_forward_button = get_node_or_null(forward_button)
	if !_forward_button: printerr('No valid path to ForwardButton node | [%s]' % get_script())
	
	_view_1 = get_node_or_null(view_1)
	if !_view_1: printerr('No valid path to View1 node | [%s]' % get_script())
	_view_2 = get_node_or_null(view_2)
	if !_view_1: printerr('No valid path to View1 node | [%s]' % get_script())
	_view_3 = get_node_or_null(view_3)
	if !_view_1: printerr('No valid path to View1 node | [%s]' % get_script())
	_views = get_node_or_null(views)
	if !_views: printerr('No valid path to Views node | [%s]' % get_script())

func _signals() -> void:
	var error_1 = _play_pause_button.pressed.connect(
		func() -> void:
			if Global.paused:
				_play_pause_button.texture_normal = preload("res://assets/elements/time_controls/pause_button.png")
			if !Global.paused:
				_play_pause_button.texture_normal = preload("res://assets/elements/time_controls/play_button.png")

			Global.paused = !Global.paused
	)
	if error_1: printerr("There was an error connecting _play_pause_button 'pressed' signal in %s" % get_script())
	
	var error_2 = _fast_forward_button.toggled.connect(
		func(button_pressed: bool) -> void:
			if button_pressed: Global.time_scale = 5
			else: Global.time_scale = 1
	)
	if error_2: printerr("There was an error connecting _fast_forward_button 'toggled' signal in %s" % get_script())

	var error_3 = _guild_button.pressed.connect(
		func() -> void:
			if Global.screen != Global.screens.GUILD:
				_cut_screen_history()
				Global.screen = Global.screens.GUILD
				Global.screen_history.append(Global.screens.GUILD)
				Global.history_position = Global.screen_history.size() - 1
				emit_signal("screen_change")
	)
	if error_3: printerr("There was an error connecting _guild_button 'pressed' signal in %s" % get_script())
	
	var error_4 = _combat_button.pressed.connect(
		func() -> void:
			if Global.screen != Global.screens.COMBAT:
				_cut_screen_history()
				Global.screen = Global.screens.COMBAT
				Global.screen_history.append(Global.screens.COMBAT)
				Global.history_position = Global.screen_history.size() - 1
				emit_signal("screen_change")
	)
	if error_4: printerr("There was an error connecting _combat_button 'pressed' signal in %s" % get_script())

	var error_5 = _back_button.pressed.connect(
		func() -> void:
			if Global.history_position > 0:
				Global.history_position -= 1
				Global.screen = Global.screen_history[Global.history_position]
				emit_signal("screen_change")
	)
	if error_5: printerr("There was an error connecting _back_button 'pressed' signal in %s" % get_script())
	
	var error_6 = _forward_button.pressed.connect(
		func() -> void:
			if Global.history_position < Global.screen_history.size() - 1:
				Global.history_position += 1
				Global.screen = Global.screen_history[Global.history_position]
				emit_signal("screen_change")
	)
	if error_6: printerr("There was an error connecting _forward_button 'pressed' signal in %s" % get_script())

func _cut_screen_history() -> void:
	if Global.history_position < Global.screen_history.size() - 1:
		Global.screen_history.resize(Global.history_position + 1)

