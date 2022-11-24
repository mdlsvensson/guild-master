class_name Unit
extends RefCounted
# Base class for all units

var _name: String
var _portrait: Dictionary = {
	"1024": null,
	"512": null,
	"256": null,
	"128": null,
	"64": null,
}
var _stats: Dictionary = {
	"baseline": {
		"hp": 100,
		"mp": 50,
	},
	"hp": null,
	"mp": null,
	"max_hp": null,
	"map_mp": null,
	"power": null,
	"brawn": null,
	"finesse": null,
	"agility": null,
	"resolution": null,
	"evasion": null,
	"accuracy": null,
}
var _spells: Array[String]

func _update_stats() -> void:
	_stats["max_hp"] = _stats["baseline"]["hp"] + (_stats["brawn"] * Global.conversions["brawn"]["hp"])
	_stats["max_mp"] = _stats["baseline"]["mp"] + (_stats["resolution"] * Global.conversions["resolution"]["mp"])
	_stats["accuracy"] = _stats["finesse"] * Global.conversions["finesse"]["accuracy"]
	_stats["evasion"] = _stats["agility"] * Global.conversions["agility"]["evasion"]

func get_portrait(size: String) -> Texture2D: return _portrait[size]

func get_name_for_node() -> String: return _name
