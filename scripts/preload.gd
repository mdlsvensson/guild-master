extends Node
class_name Preload
func get_class() -> String: return "Preloads"

var _art: Dictionary = {
	"portraits": {
		"amazon": {
			"1024": preload("res://assets/portrait/amazon/amazon_1024_1024.png"),
			"512": preload("res://assets/portrait/amazon/amazon_512_512.png"),
			"256": preload("res://assets/portrait/amazon/amazon_256_256.png"),
			"128": preload("res://assets/portrait/amazon/amazon_128_128.png"),
			"64": preload("res://assets/portrait/amazon/amazon_64_64.png")
		}
	}
}
