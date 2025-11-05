extends CharacterBody2D


var is_dragging = false
var drag_speed = 300.0  
var target_position = Vector2.ZERO
var start_position = Vector2.ZERO

@onready var collision_shape = $CollisionShape2D
@onready var shadow = $Shadow

func _ready():
	start_position = global_position
	target_position = global_position

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				if is_mouse_over_ball():
					is_dragging = true
			else:
				is_dragging = false
	if event is InputEventMouseMotion and is_dragging:
		target_position = get_global_mouse_position()

func _physics_process(_delta):
	if is_dragging:
		var direction = (target_position - global_position).normalized()
		var distance = global_position.distance_to(target_position)

		if distance > 5.0:
			velocity = direction * drag_speed
		else:
			velocity = Vector2.ZERO

		move_and_slide()
	else:
		velocity = velocity.lerp(Vector2.ZERO, 0.1)
		move_and_slide()

func is_mouse_over_ball() -> bool:
	var mouse_pos = get_global_mouse_position()
	var ball_radius = 32
	return global_position.distance_to(mouse_pos) < ball_radius

func reset_position():
	global_position = start_position
	velocity = Vector2.ZERO
	is_dragging = false
	target_position = start_position
