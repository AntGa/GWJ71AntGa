extends Node2D
@export var player: Player 

func _physics_process(delta: float) -> void:
	update_position()
	
func update_position():
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
