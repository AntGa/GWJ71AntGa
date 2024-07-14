extends Node2D

@export var offset = Vector2(16, 0) # Offset from the player

func update_position(player_global_position, player_facing):
	match player_facing:
		"Up":
			position = Vector2(0, -offset.y)
		"Down":
			position = Vector2(0, offset.y)
		"Left":
			position = Vector2(-offset.x + 15, 0)
		"Right":
			position = Vector2(offset.x - 15, 0)
	rotation = get_rotation_from_facing(player_facing)

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
