extends KinematicBody2D

export var acceleration = 100
export var SPEED = 350

#advanced vars
var motion = Vector2(0,0)
const UP = Vector2(0, -1)
var offsetright = Vector2(25,0)
var offsetleft = Vector2(-25, 0)
onready var player = get_node("/root/maestro")

var dead = false
var movingleft
var movingright

signal gets_coin()

func _ready():
	$hat.set_texture(load(maestro.hat))


#Updates every stable physics framerate.5
func _physics_process(delta):
	
	if motion.y != 0:
		motion.y = 0
	
	if movingright == true:
		motion.x = SPEED
	
	if movingleft == true:
		motion.x = -SPEED
	
	if dead == false:
		#apply the motion/ movement to the player
		#UP means platformer style
		motion = move_and_slide(motion, UP)
	
	if motion.x < 0:
		$AnimatedSprite.flip_h=true
		$AnimatedSprite.play("run")
	elif motion.x > 0:
		$AnimatedSprite.flip_h=false
		$AnimatedSprite.play("run")
	


func _unhandled_input(event):
	
	if dead == false:
		
		if event.is_action("ui_left") == true:
			
			if event.is_action_pressed("ui_left"):
				movingleft = true
				motion.x = (SPEED * -1)

			
			elif event.is_action_released("ui_left"):
				movingleft = false
				motion.x = 0
				$AnimatedSprite.flip_h=true
				$AnimatedSprite.play("idle")
			
		
		if event.is_action("ui_right")==true:
			
			if event.is_action_pressed("ui_right"):
				movingright = true
				motion.x = (SPEED * 1)
			
			elif event.is_action_released("ui_right"):
				movingright = false
				motion.x = 0
				$AnimatedSprite.flip_h=false
				$AnimatedSprite.play("idle")
			
		
	

func _on_hitbox_body_entered(body):
	
	if "cochillo" in body.name:
		dead=true
		get_tree().change_scene("res://scenes/gameover.tscn")
	
	if "coin" in body.name:
		
		print("player.score=",player.score)
		print("maestro.score=",maestro.score)
		
		maestro.score += 10
		
		var absorbed_coin = body.name
		
		(get_parent().get_node(body.name)).set_visible(false)
		
		#set collisions 1 at a time to false!
		(get_parent().get_node(absorbed_coin)).set_collision_layer_bit(0, false) #optional
		(get_parent().get_node(absorbed_coin)).set_collision_mask_bit(0, false) #optional
		(get_parent().get_node(absorbed_coin)).set_collision_layer_bit(1, false) #used by enemy
		(get_parent().get_node(absorbed_coin)).set_collision_mask_bit(1, false) # used by enemy
		(get_parent().get_node(absorbed_coin)).set_collision_layer_bit(2, false) #used by coin
		(get_parent().get_node(absorbed_coin)).set_collision_mask_bit(2, false) #used by coin
		
	
