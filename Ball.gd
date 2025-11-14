extends CharacterBody2D

# Variáveis para controlar o arrasto
var is_dragging = false
var drag_speed = 300.0  # Velocidade de movimento suave
var target_position = Vector2.ZERO
var start_position = Vector2.ZERO

# Referência ao sprite/visual da bola
@onready var collision_shape = $CollisionShape2D
@onready var shadow = $Shadow

func _ready():
	# Salva a posição inicial
	start_position = global_position
	target_position = global_position

func _input(event):
	# Detectar clique do mouse
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Verificar se o mouse está sobre a bola
				if is_mouse_over_ball():
					is_dragging = true
			else:
				# Soltar a bola
				is_dragging = false

	# Atualizar posição do arrasto
	if event is InputEventMouseMotion and is_dragging:
		target_position = get_global_mouse_position()

func _physics_process(delta):
	if is_dragging:
		# Movimento suave em direção à posição do mouse
		var direction = (target_position - global_position).normalized()
		var distance = global_position.distance_to(target_position)

		if distance > 5.0:  # Se estiver longe o suficiente, move suavemente
			velocity = direction * drag_speed
		else:
			velocity = Vector2.ZERO

		move_and_slide()
	else:
		# Quando não está sendo arrastada, aplica um pouco de fricção
		velocity = velocity.lerp(Vector2.ZERO, 0.1)
		move_and_slide()

func is_mouse_over_ball() -> bool:
	# Verifica se o mouse está sobre a bola
	var mouse_pos = get_global_mouse_position()
	var ball_radius = 32  # Ajuste conforme o tamanho da sua bola
	return global_position.distance_to(mouse_pos) < ball_radius

func reset_position():
	# Reseta a bola para a posição inicial
	global_position = start_position
	velocity = Vector2.ZERO
	is_dragging = false
	target_position = start_position
