extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var perseguir = false
var jogador = null

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	var direction = 0
	if perseguir == true:
		if jogador.position.x > position.x:
			velocity.x = SPEED
			direction = 1
		elif jogador.position.x < position.x:
			velocity.x = -SPEED
			direction = -1
		else:
			velocity.x = 0
	else:
		velocity.x = 0
		
	if velocity.x != 0:
		$AnimatedSprite2D.play("jump")
	else:
		$AnimatedSprite2D.play("idle")
		
	if direction == 1:
		$AnimatedSprite2D.flip_h = true
	elif direction == -1:
		$AnimatedSprite2D.flip_h = false
		
	move_and_slide()


func _on_area_perseguir_body_entered(body: Node2D) -> void:
	if body.name == "Personagem V 2":
		perseguir = true
		jogador =  body


func _on_area_perseguir_body_exited(body: Node2D) -> void:
	if body.name == "Personagem V 2":
		perseguir = false
		jogador = null
	print("CORPO SAIU", body.name)


func _on_killzone_area_entered(area: Area2D) -> void:
	if area.name == "Hitbox":
		jogador = area.get_parent()
		
		if jogador.name == "Personagem V 2":
			jogador.queue_free()
