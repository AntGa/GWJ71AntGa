extends Node
class_name Interactable

var Interact_UI: Control

func hide_interact():
	var tween = create_tween()
	tween.tween_property(Interact_UI, "modulate", Color.TRANSPARENT, 0.1)
	
func show_interact():
	var tween = create_tween()
	tween.tween_property(Interact_UI, "modulate", Color.WHITE, 0.1)
