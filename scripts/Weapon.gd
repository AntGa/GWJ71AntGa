extends Node2D
@export var player: Player 
var pickaxe_power: int = 1

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
	if area is HurtBoxComponent:
		var attack = Attack.new()
		attack.damage = 2.5
		attack.pickaxe_power = pickaxe_power
		area.damage(attack)

func upgrade_pickaxe_power(increase: int) -> void:
	pickaxe_power += increase
