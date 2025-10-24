extends Node2D

@export var coletavel: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if %"Personagem V 2".cerejas >= 3:
		get_tree().change_scene_to_file("res://fase_3.tscn")


#func _on_spawnar_cereja_timeout() -> void:
	#var novaCereja = coletavel.instantiate()
	#
	#var random = RandomNumberGenerator.new()
	#var posicaoX = random.randi_range(20,1130)
	#var posicaoY = random.randi_range(400,550)
	#
	#novaCereja.position = Vector2(posicaoX, posicaoY)
	#add_child(novaCereja)
	#
	
