extends Node2D
class_name HealthComponent

@export var max_health := 10.0
@export var rock : Sprite2D
var health : float


func _ready() -> void:
	health = max_health

	
func damage(attack: Attack):
	health -= attack.damage

	if health <= 0:
		var tween: Tween = get_tree().create_tween()
		tween.tween_property(rock, "modulate", Color(255,255,255, 0), 0.3)
		await(get_tree().create_timer(1).timeout)
		get_parent().queue_free()
	else:
		# Trigger vibration effect
		start_vibration()
		flash_color()
		GameManager.add_money(1)
		
func start_vibration():
	var origin = rotation_degrees
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(rock, "rotation_degrees", rotation_degrees + 10, 0.2)
	tween.tween_property(rock, "rotation_degrees", origin, 0.2)

func flash_color():
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(rock, "modulate", Color(1, 1, 1), 0.1).as_relative().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(rock, "modulate", Color.WHITE, 0.1)


