extends Area2D

# Sinal emitido quando a bola acerta o alvo
signal target_hit

# Variável para controlar se o alvo já foi atingido
var is_hit = false

func _ready():
	# Conecta o sinal de detecção de corpo
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# Verifica se o corpo que entrou é a bola e se ainda não foi atingido
	if body.name == "Ball" and not is_hit:
		is_hit = true
		print("Alvo atingido!")

		# Emite sinal para o gerenciador do jogo
		target_hit.emit()

		# Efeito visual (opcional - piscar)
		flash_effect()

func flash_effect():
	# Efeito de piscar quando acerta
	var tween = create_tween()
	tween.set_loops(3)
	tween.tween_property(self, "modulate:a", 0.3, 0.15)
	tween.tween_property(self, "modulate:a", 1.0, 0.15)

func reset():
	# Reseta o estado do alvo
	is_hit = false
	modulate.a = 1.0
