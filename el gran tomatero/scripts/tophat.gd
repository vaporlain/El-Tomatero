extends Button


func _on_tophat_button_up():
	if maestro.score >= 250:
		maestro.score -= 250
		maestro.hat = "res://img/tophat.png"
	else:
		print("no TCoins")
