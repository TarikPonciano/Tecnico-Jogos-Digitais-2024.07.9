extends Node2D

const PORT_SERVIDOR = 5555
var peer = null


func _on_botao_criar_pressed() -> void:
	peer = ENetMultiplayerPeer.new()
	var result = peer.create_server(PORT_SERVIDOR)
	print("Tentativa de criar servidor")
	
	if result != OK:
		print("Erro ao criar servidor")
		peer = null
		return
		
	print("Servidor criado com sucesso")
	multiplayer.multiplayer_peer = peer

func _on_botao_conectar_pressed() -> void:
	print("Tentativa de conectar")
	
