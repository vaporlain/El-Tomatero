extends Control

var ready = false
onready var player = get_node("/root/maestro")
var string1 = "TCoins:%d"

func _ready():
	ready = true


func _process(delta):
	if ready:
		get_node("score").text = string1 % maestro.score
	 
