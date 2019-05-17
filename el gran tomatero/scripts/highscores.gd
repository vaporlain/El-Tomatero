extends Label


func _ready():
	self.text = "TCoins:%d" % maestro.score



func _on_Timer_timeout():
	$Timer.start()
	print("score updated")
	self.text = "TCOINS:%d" % maestro.score
