extends Node
@onready var player: Player = get_parent()
@export var animations: AnimatedSprite2D
@export var movement_component: MovementComponent


func _physics_process(delta: float) -> void:
	if player.InAction:
		return
		
	if movement_component.wants_mine():
		player.InAction = true
		animations.play("PlayerMine" + player.facing)
		return
		
	if player.velocity.y == 0 && player.velocity.x == 0:
		animations.play("PlayerIdle" + player.facing)
		return
	else:
		if player.velocity.y < 0:
			player.facing = "Up"
		elif player.velocity.y > 0:
			player.facing = "Down"
		elif player.velocity.x > 0:
			player.facing = "Right"
		elif player.velocity.x < 0:
			player.facing = "Left"
		animations.play("PlayerWalk" + player.facing)
		return
	
func _on_animated_sprite_2d_animation_finished() -> void:
	if animations.animation == "PlayerMine" + player.facing:
		player.InAction = false
			
