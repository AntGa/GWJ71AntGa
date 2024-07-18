extends Node
@onready var player: Player = get_parent()
@export var animations: AnimatedSprite2D
@export var movement_component: MovementComponent
var facing_vector: Vector2


func _physics_process(delta: float) -> void:
	facing_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if player.InAction:
		return
		
	update_facing_direction()
	
	if movement_component.wants_mine():
		player.InAction = true
		animations.play("PlayerMine" + player.facing)
		return
		
	if player.velocity.y == 0 && player.velocity.x == 0:
		animations.play("PlayerIdle" + player.facing)
		return
	else:
		animations.play("PlayerWalk" + player.facing)
		return

func update_facing_direction():
	if facing_vector.y < 0:
		player.facing = "Up"
	elif facing_vector.y > 0:
		player.facing = "Down"
	elif facing_vector.x > 0:
		player.facing = "Right"
	elif facing_vector.x < 0:
		player.facing = "Left"

func _on_animated_sprite_2d_animation_finished() -> void:
	if animations.animation == "PlayerMine" + player.facing:
		player.InAction = false
			
