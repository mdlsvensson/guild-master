class_name Unit
extends PanelContainer
# Base class for all units

signal test_1

enum test_2 {
	test_3,
}
const TEST_4 = 1
@export var baseline_hp: int
@export var baseline_mp: int
@export var power: int
@export var brawn: int
@export var finesse: int
@export var agility: int
@export var resolution: int
@export var spells: Array[String]
var public_var = "public"
var _stats: Dictionary = {
	hp = 0,
	max_hp = 0,
	mp = 0,
	max_mp = 0,
	power = 0,
	brawn = 0,
	finesse = 0,
	agility = 0,
	resolution = 0,
	evasion = 0.0,
	accuracy = 0.0,
}
var _spells: Array[Spell]
@onready var onready = "onready"

func _init() -> void:
	_stats.power = power
	_stats.brawn = brawn
	_stats.finesse = finesse
	_stats.agility = agility
	_stats.resolution = resolution
	_stats.max_hp = baseline_hp + (brawn * Global.conversions.brawn.hp)
	_stats.max_mp = baseline_mp + (resolution * Global.conversions.resolution.mp)
	_stats.evasion = agility * Global.conversions.agility.evasion
	_stats.accuracy = finesse * Global.conversions.finesse.accuracy

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
