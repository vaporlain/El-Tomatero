extends Button

func _on_parthat_button_up():
	if maestro.score >= 250:
		maestro.score -= 250
		maestro.hat = "res://img/partyhat.png"
	else:
		print("no TCoins")
