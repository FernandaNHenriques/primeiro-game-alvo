extends Node2D

# Referências aos objetos do jogo
@onready var ball = $Ball
@onready var target = $Target
@onready var label = $UI/Label
@onready var restart_button = $UI/RestartButton

# Variáveis do jogo
var score = 0
var attempts = 0
var game_won = false

func _ready():
	# Conecta o sinal do alvo
	target.target_hit.connect(_on_target_hit)

	# Conecta o botão de restart
	restart_button.pressed.connect(_on_restart_pressed)
	restart_button.visible = false

	# Atualiza a UI inicial
	update_ui()

func _on_target_hit():
	# Quando o alvo é atingido
	game_won = true
	score += 1
	attempts += 1

	# Atualiza a UI
	update_ui()

	# Mostra mensagem de vitória
	label.text = "PARABÉNS! Você acertou o alvo!\nTentativas: %d" % attempts

	# Mostra o botão de reiniciar
	restart_button.visible = true

func _on_restart_pressed():
	# Reinicia o jogo
	game_won = false

	# Reseta a bola e o alvo
	ball.reset_position()
	target.reset()

	# Esconde o botão
	restart_button.visible = false

	# Atualiza a UI
	update_ui()

func update_ui():
	if not game_won:
		label.text = "Arraste a bola até o alvo!"
