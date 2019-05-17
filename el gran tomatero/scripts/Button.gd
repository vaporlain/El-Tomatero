extends Button

#var isReal = false
#var isTop = true
#var admob = null
#var adBannerId = "ca-app-pub-3940256099942544/6300978111" # test id
#var debug = null

#func _ready():
#	if(Engine.has_singleton("AdMob")):
#		admob = Engine.get_singleton("AdMob")
#		admob.init(isReal, get_instance_id())
#		loadBanner()
#	debug = get_node("CanvasLayer/debug")
#	get_tree().connect("screen_resized", self, "onResize")

# Loaders

#func loadBanner():
#	if admob != null:
#		admob.loadBanner(adBannerId, isTop)

func _on_Button_button_up():
	get_tree().change_scene("res://scenes/game.tscn")


func _on_shop_button_button_up():
	get_tree().change_scene("res://scenes/shop.tscn")


func _on_credits_button_button_up():
	get_tree().change_scene("res://scenes/credits.tscn")
