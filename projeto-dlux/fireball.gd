extends Area2D

var speed = 300

func _physics_process(delta: float) -> void:
	position.x += speed * delta
	
	if speed < 0:
		$AnimatedSprite2D.flip_h = true


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Inimigos"):
		body.tomar_dano(1)
		self.queue_free()


func _on_expirar_timeout() -> void:
	self.queue_free()
