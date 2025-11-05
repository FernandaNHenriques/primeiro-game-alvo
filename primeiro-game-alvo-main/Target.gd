extends Area2D

signal target_hit

var is_hit = false

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Ball" and not is_hit:
		is_hit = true
		print("Alvo atingido!")
		target_hit.emit()
		flash_effect()

func flash_effect():
	var tween = create_tween()
	tween.set_loops(3)
	tween.tween_property(self, "modulate:a", 0.3, 0.15)
	tween.tween_property(self, "modulate:a", 1.0, 0.15)

func reset():
	is_hit = false
	modulate.a = 1.0
