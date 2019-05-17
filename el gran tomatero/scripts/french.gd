extends Button

signal bought()

func _on_french_button_up():
	if maestro.score >= 250:
		maestro.score -= 250
		maestro.hat = "res://img/french.png"
	else:
		print("no TCoins")
