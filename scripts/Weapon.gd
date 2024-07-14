extends Node2D

@export var offset = Vector2(16, 0) # Offset from the player
@export var player: Player 

func _physics_process(delta: float) -> void:
	update_position()
	
func update_position():
	match player.facing:
		"Up":
			position = Vector2(0, -offset.y)
		"Down":
			position = Vector2(0, offset.y)
		"Left":
			position = Vector2(-offset.x + 15, 0)
		"Right":
			position = Vector2(offset.x - 15, 0)
	rotation = get_rotation_from_facing(player.facing)

func get_rotation_from_facing(facing):
	match facing:
		"Up":
			return -PI / 2
		"Down":
			return PI / 2
		"Left":
			return PI
		"Right":
			return 0
	return 0


func _on_weapon_area_entered(area: Area2D) -> void:
	if area is HitboxComponent:
		var attack = Attack.new()
		attack.damage = 2.5
		area.damage(attack)
