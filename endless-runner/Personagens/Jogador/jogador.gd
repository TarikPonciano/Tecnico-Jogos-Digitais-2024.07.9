extends CharacterBody2D


const SPEED = 300.0 
const JUMP_VELOCITY = -400.0
var pulo_duplo = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if is_on_floor():
		pulo_duplo = false

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		pulo_duplo = true
		
	if Input.is_action_just_pressed("ui_accept") and not is_on_floor() and pulo_duplo == true:
		velocity.y = JUMP_VELOCITY
		pulo_duplo = false

	
	#Mudando a velocidade usando if/else
	
	#if Input.is_action_pressed("ui_left"):
		#velocity.x = 100
	#elif Input.is_action_pressed("ui_right"):
		#velocity.x = 500
	#else:
		#velocity.x = 300
		
	#Controle de velocidade com base no input do jogador
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = (300 + (direction*200)) * (Global.dificuldade/2)
	
	#Lógica para matar o jogador
	if position.y >= 700:
		get_tree().reload_current_scene()

		
		
	if velocity.y < 0:
		$AnimatedSprite2D.play("jump")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("fall")
	elif velocity.x != 0:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")

	move_and_slide()
