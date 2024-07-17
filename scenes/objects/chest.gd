extends Node2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var item_scene: PackedScene = preload("res://scenes/buildings/bronze_pickaxe.tscn")
var opened: bool = false
var in_area: bool = false

func _process(delta: float) -> void:
	if not in_area:
		return
	if Input.is_action_just_pressed("interact"):
		sprite.play("ChestOpen")

func _on_animated_sprite_2d_animation_finished() -> void:
	spawn_item()


func spawn_item() -> void:
	var item_instance = item_scene.instantiate()
	add_child(item_instance)
	item_instance.position = Vector2(0,0)
	var random_angle = randf_range(0, 2 * PI)
	var force_magnitude = 500
	var item_velocity = Vector2(cos(random_angle), sin(random_angle)) * force_magnitude
	item_instance.set("velocity", item_velocity) 
	opened = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if !opened:
		in_area = true
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	in_area = false

