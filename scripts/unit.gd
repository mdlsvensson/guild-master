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
	"accuracy": null,
	"evasion": null,
	"range": null,
}
var _bonus_stats: Dictionary = {
	"hp": null,
	"mp": null,
	"power": null,
	"brawn": null,
	"finesse": null,
	"agility": null,
	"resolution": null,
	"accuracy": null,
	"evasion": null,
	"range": null,
}
var _items: Dictionary = {
	"left_hand": null,
	"head": null,
	"armor": null,
	"boots": null,
	"ring_1": null,
	"ring_2": null,
	"neck": null,
	"trinket_1": null,
	"trinket_2": null
}
var _spells: Dictionary = {}
var _bag: Dictionary = {}

func _update_stats() -> void:
	_stats["max_hp"] = _stats["baseline"]["hp"] + (_stats["brawn"] * Global.conversions["brawn"]["hp"])
	_stats["max_mp"] = _stats["baseline"]["mp"] + (_stats["resolution"] * Global.conversions["resolution"]["mp"])
	_stats["accuracy"] = _stats["finesse"] * Global.conversions["finesse"]["accuracy"]
	_stats["evasion"] = _stats["agility"] * Global.conversions["agility"]["evasion"]

func get_portrait(size: String) -> Texture2D: return _portrait[size]

func get_data() -> Dictionary:
	return {
		"name": _name,
		"portrait": _portrait,
		"stats": _stats,
		"bonus_stats": _bonus_stats,
		"items": _items,
		"spells": _spells,
		"bag": _bag
	}

func get_name_for_node() -> String: return _name

func apply_stats(item: Item) -> void:
	for stat in _bonus_stats:
		if item.has_stat(stat): _bonus_stats[stat] = item.get_stat(stat)
