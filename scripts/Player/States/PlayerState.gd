extends State
class_name PlayerState

@onready var player : Player = get_owner()
var movement_component : MovementComponent
var animations : AnimatedSprite2D
signal transitioned(state: PlayerState, new_state_name: String)

func _physics_process(delta: float) -> void:
	if player.InAction:
		return
	
	if movement_component.wants_mine():
		transitioned.emit(self, "PlayerMine")
		return
	
	if movement_component.wants_upgrade():
		GameManager.activate_upgrade()
