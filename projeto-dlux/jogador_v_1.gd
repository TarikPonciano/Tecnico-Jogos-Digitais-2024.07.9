extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -800.0


func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var direction := Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if direction != Vector2(0,0):
		velocity = direction.normalized() * Vector2(300,300)
	else:
		velocity.x = move_toward(velocity.x, 0, 300)
		velocity.y = move_toward(velocity.y, 0, 300)

	
	
	move_and_slide()
