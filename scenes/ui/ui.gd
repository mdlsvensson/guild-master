extends Control
func get_class() -> String: return 'UI'

var _play_pause_button: TextureButton
var _fast_forward_button: TextureButton
var _time_display: Label
@export var play_pause_button: NodePath
@export var fast_forward_button: NodePath
@export var time_display: NodePath

func _ready() -> void:
	_play_pause_button = get_node_or_null(play_pause_button)
	if !_play_pause_button: printerr('Path to PlayPauseButton node returned null | [%s]' % get_script())

	_fast_forward_button = get_node_or_null(fast_forward_button)
	if !_fast_forward_button: printerr('Path to FastForwardButton node returned null | [%s]' % get_script())

	_time_display = get_node_or_null(time_display)
	if !_time_display: printerr('Path to TimeDisplay node returned null | [%s]' % get_script())

	var error_1 = _play_pause_button.pressed.connect(_on_play_pause_button_pressed)
	if error_1: printerr("There was an error connecting _play_pause_button 'pressed' signal in %s" % get_script())

	var error_2 = _fast_forward_button.toggled.connect(_on_fast_forward_button_toggled)
	if error_2: printerr("There was an error connecting _fast_forward_button 'toggled' signal in %s" % get_script())

func update_time_display(val: int) -> void:
	var hour_string: String
	var minute_string: String

	if Global.time.hours <= 9: hour_string = "0" + str(Global.time.hours)
	else: hour_string = str(Global.time.hours)
	if Global.time.minutes <= 9: minute_string = "0" + str(Global.time.minutes)
	else: minute_string = str(Global.time.minutes)

	_time_display.text = hour_string + ':' + minute_string

func _on_play_pause_button_pressed() -> void:
	if Global.paused:
		_play_pause_button.texture_normal = preload("res://assets/elements/time_controls/pause_button.png")
	if !Global.paused:
		_play_pause_button.texture_normal = preload("res://assets/elements/time_controls/play_button.png")

	Global.paused = !Global.paused

func _on_fast_forward_button_toggled(button_pressed: bool) -> void:
	if button_pressed: Global.time_scale = 5
	else: Global.time_scale = 1
