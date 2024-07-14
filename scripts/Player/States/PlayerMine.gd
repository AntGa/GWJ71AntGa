extends PlayerState

func enter() -> void:
	await(get_tree().create_timer(1.1).timeout)
	transitioned.emit(self, "PlayerMove")
