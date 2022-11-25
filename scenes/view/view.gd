class_name View
extends PanelContainer
# Base Node for all views. Attach appropriate view container to the VBoxContainer.

@export_node_path(VBoxContainer) var v_box
var _vbox: VBoxContainer

func _ready() -> void:
	_vbox = get_node_or_null(v_box)
	if !_vbox: printerr('No valid path to VBoxContainer node | [%s]' % get_script())

func set_view(view_root_node: Control) -> void: _vbox.add_child(view_root_node)
