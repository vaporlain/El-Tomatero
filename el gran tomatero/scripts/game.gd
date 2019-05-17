extends Node2D

func _ready():
	if (OS.has_touchscreen_ui_hint() == false):
		$rightpad.set_visible(false)
		$leftpad.set_visible(false)
	else:
		$rightpad.set_visible(true)
		$leftpad.set_visible(true)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
