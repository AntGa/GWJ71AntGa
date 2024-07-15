extends Node
class_name MovementComponent

func get_movement_direction() -> Vector2:
	return Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	
# Return a boolean indicating if the character wants to jump
func wants_mine() -> bool:
	return Input.is_action_just_pressed('mine')

func wants_upgrade() -> bool:
	return Input.is_action_just_pressed("upgrade")
