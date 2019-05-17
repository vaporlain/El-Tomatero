extends KinematicBody2D

export var fallspeed = 200
var motion = Vector2(0,fallspeed)
const UP = Vector2(0, -1) 

func _ready():
	
	position.x = (randi() % 400 + 40)
	position.y = -50
	
	fallspeed += (randi() % 100 + 200)
	motion = Vector2(0,fallspeed)
	
	randomize()

func _physics_process(delta):
	move_and_slide(motion, UP)