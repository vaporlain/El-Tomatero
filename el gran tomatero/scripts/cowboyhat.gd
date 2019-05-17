extends Button

func _on_cowboyhat_button_up():
	if maestro.score >= 250:
		maestro.score -= 250
		maestro.hat = "res://img/cowboy.png"
	else:
		print("no TCoins")