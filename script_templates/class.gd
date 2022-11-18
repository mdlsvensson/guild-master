class_name MyClass
extends Node
# A template for gdscript classes following the Godot documentation style guide

signal test_1

enum test_2 {
	test_3,
}
const TEST_4 = 1
@export var test_5: NodePath
var public_var = "public"
var _private_var = "private"
@onready var onready = "onready"

func _init() -> void:
	pass

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func public() -> void:
	pass

func _private() -> void:
	pass
