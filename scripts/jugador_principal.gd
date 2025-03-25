extends CharacterBody2D

var speed =100
var player_state
@onready var animacion: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	var direction=Input.get_vector("left","right","up","down")
	
	if direction.x==0 and direction.y ==0:
		player_state="idle"
	elif direction.x !=0 or direction.y !=0:
		player_state="walking"
	
	velocity = direction*speed
	move_and_slide()
	
	play_animacion(direction)

func play_animacion(dir):
	if player_state=="idle":
		animacion.play("idle")
	if player_state=="walking":
		if dir.y == -1:
			animacion.play("sword_attack1")
		elif dir.x == 1:
			animacion.play("walk_right")
		elif dir.y ==1:
			animacion.play("sword_attack1")
		elif dir.x== -1:
			animacion.play("walk_right")
