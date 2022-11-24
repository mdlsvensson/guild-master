class_name Amazon
extends Unit

func _init() -> void:
	_name = "Amazon"

	_portrait["1024"] = preload("res://assets/portrait/amazon/amazon_1024_1024.png")
	_portrait["512"] = preload("res://assets/portrait/amazon/amazon_512_512.png")
	_portrait["256"] = preload("res://assets/portrait/amazon/amazon_256_256.png")
	_portrait["128"] = preload("res://assets/portrait/amazon/amazon_128_128.png")
	_portrait["64"] = preload("res://assets/portrait/amazon/amazon_64_64.png")

	_stats["power"] = 15
	_stats["brawn"] = 13
	_stats["finesse"] = 24
	_stats["agility"] = 29
	_stats["resolution"] = 19

	_update_stats()
