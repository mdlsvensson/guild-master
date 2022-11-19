extends Node
# Global variables autoload

#enum paused {
#	TRUE,
#	FALSE
#}

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
