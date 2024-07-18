extends Control

signal start_game()
@onready var buttons_vbox: VBoxContainer = $MarginContainer/VBoxContainer/ButtonsVbox

func _ready() -> void:
	SoundManager.play_sound("FIRSTSNOW")
	focus_button()
	

func focus_button() -> void:
	if buttons_vbox:
		var button: Button = buttons_vbox.get_child(0)
		if button is Button:
			button.grab_focus()	


func _on_start_pressed() -> void:
	start_game.emit()
	TransitionManager.change_scene()
	hide()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_visibility_changed() -> void:
	if visible:
		focus_button()
		
