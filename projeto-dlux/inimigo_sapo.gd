extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var perseguir = false
var jogador = null
var dying = false

func _physics_process(delta: float) -> void:
	
	if dying:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if perseguir:
		if jogador.position.x > position.x:
			velocity.x = SPEED
		elif jogador.position.x < position.x:
			velocity.x = -SPEED
		else:
			velocity.x = 0
	else:
		velocity.x = 0


		
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

func death():
	
	dying = true
	$CollisionShape2D.call_deferred("queue_free")
	$AnimatedSprite2D.play("death")
	await $AnimatedSprite2D.animation_finished
	call_deferred("queue_free")
	
	


func _on_kill_zone_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("Player") and area.name=="DeathZone":
		area.get_parent().death()
