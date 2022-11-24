class_name Lifestealer
extends Unit

func _init() -> void:
	_name = "Lifestealer"

	_portrait["1024"] = preload("res://assets/portrait/lifestealer/lifestealer_1024_1024.png")
	_portrait["512"] = preload("res://assets/portrait/lifestealer/lifestealer_512_512.png")
	_portrait["256"] = preload("res://assets/portrait/lifestealer/lifestealer_256_256.png")
	_portrait["128"] = preload("res://assets/portrait/lifestealer/lifestealer_128_128.png")
	_portrait["64"] = preload("res://assets/portrait/lifestealer/lifestealer_64_64.png")

	_stats["power"] = 23
	_stats["brawn"] = 18
	_stats["finesse"] = 25
	_stats["agility"] = 14
	_stats["resolution"] = 20

	_update_stats()
