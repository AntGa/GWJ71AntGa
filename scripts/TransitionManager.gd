extends CanvasLayer

func _ready() -> void:
	self.visible = false
	
func change_scene() -> void:
	self.visible = true
	$AnimationPlayer.play("transition")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play_backwards("transition")
	self.visible = false
