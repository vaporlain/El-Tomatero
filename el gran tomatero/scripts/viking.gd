extends Button

func _on_viking_button_up():
	if maestro.score >= 250:
		maestro.score -= 250
		maestro.hat = "res://img/viking.png"
		print("maestro.hat=",maestro.hat)
	else:
		print("no TCoins")
