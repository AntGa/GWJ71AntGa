extends PlayerState

func enter() -> void:
	await(get_tree().create_timer(0.5).timeout)
	player.weaponCollision.set_deferred("disabled", false)
	await(get_tree().create_timer(0.6).timeout)
	transitioned.emit(self, "PlayerMove")
	player.weaponCollision.set_deferred("disabled", true)
