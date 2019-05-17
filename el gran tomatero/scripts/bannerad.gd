extends Node2D

var admob = null
var isReal = false
var isTop = true
var adBannerId = "ca-app-pub-3940256099942544/6300978111" # test id
var adInterstitialId = "ca-app-pub-3940256099942544/1033173712" 
var adRewardedId = "ca-app-pub-3940256099942544/8691691433" 
var debug = null
var isbieunguloaded = false
var istrunggianloaded = false

func _ready():
	if(Engine.has_singleton("AdMob")):
		admob = Engine.get_singleton("AdMob")
		admob.init(isReal, get_instance_id())
		loadBanner()
		loadInterstitial()
		loadRewardedVideo()
	debug = get_node("CanvasLayer/debug")
	get_tree().connect("screen_resized", self, "onResize")
	_on_Banner()
	

# Loaders

func loadBanner():
	if admob != null:
		admob.loadBanner(adBannerId, isTop)

func loadInterstitial():
	if admob != null:
		admob.loadInterstitial(adInterstitialId)
		
func loadRewardedVideo():
	if admob != null:
		admob.loadRewardedVideo(adRewardedId)

# Events

func _on_Banner():
	if admob != null:
		admob.showBanner()

func _on_BtnInterstitial_pressed():
	if admob != null:
		admob.showInterstitial()
		
func _on_BtnRewardedVideo_pressed():
	if admob != null:
		admob.showRewardedVideo()

func _on_admob_network_error():
	debug.text = "Network Error"
	if(Engine.has_singleton("AdMob")):
		admob = Engine.get_singleton("AdMob")
		admob.init(isReal, get_instance_id())
		loadBanner()

func _on_admob_ad_loaded():
	debug.text = "Banner loaded success"
	get_node("CanvasLayer/BtnBanner").set_disabled(false)

func _on_interstitial_not_loaded():
	debug.text = "Error: Interstitial not loaded"
	if(Engine.has_singleton("AdMob")):
		admob = Engine.get_singleton("AdMob")
		admob.init(isReal, get_instance_id())
		loadInterstitial()

func _on_interstitial_loaded():
	debug.text = "Interstitial loaded"
	get_node("CanvasLayer/BtnInterstitial").set_disabled(false)

func _on_interstitial_close():
	debug.text = "Interstitial closed"
	get_node("CanvasLayer/BtnInterstitial").set_disabled(true)

func _on_rewarded_video_ad_loaded():
	debug.text = "Rewarded loaded success"
	get_node("CanvasLayer/BtnRewardedVideo").set_disabled(false)
	
func _on_rewarded_video_ad_closed():
	debug.text = "Rewarded closed"
	get_node("CanvasLayer/BtnRewardedVideo").set_disabled(true)
	loadRewardedVideo()
	
func _on_rewarded(currency, amount):
	debug.text = "Reward: " + currency + ", " + str(amount)
	get_node("CanvasLayer/LblRewarded").set_text("Reward: " + currency + ", " + str(amount))

# Resize

func onResize():
	if admob != null:
		admob.resize()



func _on_Despawner_body_exited(body):
	get_node(body.name).queue_free()
