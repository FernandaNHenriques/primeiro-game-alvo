extends Node2D

@onready var ball = $Ball
@onready var target = $Target
@onready var label = $UI/Label
@onready var restart_button = $UI/RestartButton

var score = 0
var attempts = 0
var game_won = false

func _ready():
	target.target_hit.connect(_on_target_hit)
	restart_button.pressed.connect(_on_restart_pressed)
	restart_button.visible = false
	
	update_ui()

func _on_target_hit():
	game_won = true
	score += 1
	attempts += 1

	update_ui()

	label.text = "PARABÉNS! Você acertou o alvo!\nTentativas: %d" % attempts

	restart_button.visible = true

func _on_restart_pressed():
	game_won = false

	ball.reset_position()
	target.reset()
	restart_button.visible = false
	update_ui()

func update_ui():
	if not game_won:
		label.text = "Arraste a bola até o alvo!"
