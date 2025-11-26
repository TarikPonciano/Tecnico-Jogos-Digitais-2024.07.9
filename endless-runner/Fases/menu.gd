extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_iniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://Fases/fase1.tscn")


func _on_sair_pressed() -> void:
	get_tree().quit()


func _on_fácil_pressed() -> void:
	Global.dificuldade = 1

func _on_médio_pressed() -> void:
	Global.dificuldade = 2

func _on_difícil_pressed() -> void:
	Global.dificuldade = 3
