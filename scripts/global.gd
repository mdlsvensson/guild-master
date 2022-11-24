extends Node
# Global variables autoload

enum screens {
	GUILD,
	COMBAT
}
var screen: int = screens.GUILD
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
