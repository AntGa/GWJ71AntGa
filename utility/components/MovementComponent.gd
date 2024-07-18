extends Node
class_name MovementComponent

func get_movement_direction() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	
# Return a boolean indicating if the character wants to jump
func wants_mine() -> bool:
	return Input.is_action_just_pressed('mine')

func wants_upgrade() -> bool:
	return Input.is_action_just_pressed("interact")
