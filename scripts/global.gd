extends Node
# Global variables autoload

enum screens {
	GUILD,
	COMBAT
}
enum slots {
	LEFT_HAND,
	RIGHT_HAND,
	HEAD,
	ARMOR,
	BOOTS,
	RING_1,
	RING_2,
	NECK,
	TRINKET_1,
	TRINKET_2
}
var screen: int = screens.GUILD
var screen_history: Array[int] = [0]
var history_position: int = 0
var paused: bool = false
var time_scale: int = 1
var time: Dictionary = {
	"minutes": 0,
	"hours": 0,
}
var date: Dictionary = {
	"day": 1,
	"season": "Summer",
	"year": 1,
}
var conversions: Dictionary = {
	brawn = {
		hp = 20
	},
	resolution = {
		mp = 12
	},
	finesse = {
		accuracy = 0.1,
	},
	agility = {
		evasion = 0.1
	}
}
