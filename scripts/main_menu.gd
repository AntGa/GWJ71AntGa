extends Control

signal start_game()
@onready var buttons_vbox: VBoxContainer = $MarginContainer/VBoxContainer/ButtonsVbox
@onready var margin_container: MarginContainer = $MarginContainer
@onready var audiocontroller: MarginContainer = $AUDIOCONTROLLER
@onready var SFX_BUS = AudioServer.get_bus_index("SFX")
@onready var MUSIC_BUS = AudioServer.get_bus_index("MUSIC")
@onready var MASTER_BUS = AudioServer.get_bus_index("Master")

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
		
func _on_options_pressed() -> void:
	margin_container.visible = false
	audiocontroller.visible = true
	


func _on_quit_button_pressed() -> void:
	audiocontroller.visible = false
	margin_container.visible = true


func _on_musicslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(MUSIC_BUS, linear_to_db(value))
	AudioServer.set_bus_mute(MUSIC_BUS, value < 0.05)


func _on_sfxslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(SFX_BUS, linear_to_db(value))
	AudioServer.set_bus_mute(SFX_BUS, value < 0.05)


func _on_masterslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(MASTER_BUS, linear_to_db(value))
	AudioServer.set_bus_mute(MASTER_BUS, value < 0.05)
