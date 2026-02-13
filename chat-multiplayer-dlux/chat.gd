extends Control

const PORT = 5050
var peer = null

var endereco_ip = null
var porta_cliente = null

var chat_log = "CHAT:"

func connect_server():
	peer = ENetMultiplayerPeer.new()
	
	endereco_ip = $Panel/LineEdit.text
	porta_cliente = $Panel/LineEdit2.text
	
	var result = peer.create_client(endereco_ip, int(porta_cliente))
	
	if result != OK:
		print("Erro ao conectar ao servidor")
		print(result)
		$Panel/Label.text = "Erro de Conexão"
		return
	
	multiplayer.multiplayer_peer = peer
	print("Conectado ao servidor com sucesso")
	$Panel/Label.text = "Conectado com sucesso"

func start_server():
	#  Criar o objeto de conexão
	peer = ENetMultiplayerPeer.new()
	
	# Cria o servidor
	var result = peer.create_server(PORT)
	
	# Verificar se aconteceu algum erro
	if result != OK:
		print("ERRO AO CRIAR O SERVIDOR")
		print(result)
		peer = null
		$Panel/Label.text = "Erro ao Criar Servidor!"
		return
	
	# Cadastra a conexão na janela atual da GODOT
	multiplayer.multiplayer_peer = peer
	
	print("SERVIDOR CRIADO COM SUCESSO")
	$Panel/Label.text = "Servidor Operando!"
	
	multiplayer.peer_connected.connect(novo_usuario)
	
func novo_usuario(id: int):
	
	chat_log += str("\n Jogador ", id, " se conectou!")
	
	atualizar_chat(chat_log)
	rpc("atualizar_chat", chat_log)
	
	
@rpc("any_peer")
func atualizar_chat(mensagens):
	$Panel/RichTextLabel.text = mensagens
	
	

	
	
