extends Control

@export_node_path(FlowContainer) var flow_container
var _flow_container: FlowContainer

func _ready() -> void:
	_flow_container = get_node_or_null(flow_container)
	if !_flow_container: printerr('Path to GridContainer node returned null | [%s]' % get_script())

func add_card_to_flow(texture_button: TextureButton) -> void: _flow_container.add_child(texture_button)

