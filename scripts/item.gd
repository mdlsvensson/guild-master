class_name Item
extends RefCounted
# Base class for all item data

var _name: String
var _portrait: Dictionary = {
	"1024": null,
	"512": null,
	"256": null,
	"128": null,
	"64": null,
}
var _stats: Dictionary = {
	"hp": null,
	"mp": null,
	"power": null,
	"brawn": null,
	"finesse": null,
	"agility": null,
	"resolution": null,
	"evasion": null,
	"accuracy": null,
}

func get_portrait(size: String) -> Texture2D: return _portrait[size]

func get_name_for_node() -> String: return _name

func get_stat(stat: String): return _stats[stat]

func has_stat(stat: String) -> bool: return _stats.has(stat)
