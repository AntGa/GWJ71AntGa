extends CharacterBody2D
class_name Player


@onready var facing: String = "Right"
@onready var InAction: bool = false
@onready var weapon = $Weapon

func _physics_process(delta: float) -> void:
	weapon.update_position(global_position, facing)
