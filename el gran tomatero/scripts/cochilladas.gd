extends Node2D

export (PackedScene) var cochillo_import
var spawntime = 2
onready var cochillo_referencia = load(cochillo_import.get_path())

export (PackedScene) var coin_import
var coinspawntime = 2
onready var coin_referencia = load(coin_import.get_path())

func _ready():
	_on_spawntime()
	$Timer.wait_time = spawntime

func _on_spawntime():
	
	# - SPAWN COCHILLO - 
	if spawntime > 0.20:
		spawntime -= 0.035
		$Timer.wait_time = spawntime
	
	var cochillo_nuevo = cochillo_referencia.instance();
	
	get_parent().add_child(cochillo_nuevo)
	
	# - SPAWN UN TOMATO COIN - 
	if spawntime > 0.20:
		spawntime -= 0.035
		$Timer.wait_time = spawntime
	
	var coin_nuevo = coin_referencia.instance();
	
	get_parent().add_child(coin_nuevo)
	
	#Como saber las propiedades del objeto nuevo:
	#cochillo/ coin + /nuevo es el nombre, aqui.
	#print("y me encuentro en " ,cochillo_nuevo.position)
