extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.dificuldade == 1:
		text = "Dificuldade Selecionada: Fácil"
	elif Global.dificuldade == 2:
		text = "Dificuldade Selecionada: Médio"
	elif Global.dificuldade == 3:
		text = "Dificuldade Selecionada: Difícil"
	else:
		text = "Dificuldade Selecionada: DESCONHECIDO"
