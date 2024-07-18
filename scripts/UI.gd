extends CanvasLayer
class_name UI

signal start_game()

@onready var SFX_BUS = AudioServer.get_bus_index("SFX")
@onready var MUSIC_BUS = AudioServer.get_bus_index("MUSIC")
@onready var MASTER_BUS = AudioServer.get_bus_index("Master")
@onready var pause_menu: Control = $PauseMenu
@onready var main_menu: Control = $MainMenu

func _on_sfxslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(SFX_BUS, linear_to_db(value))
	AudioServer.set_bus_mute(SFX_BUS, value < 0.05)

func _on_musicslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(MUSIC_BUS, linear_to_db(value))
	AudioServer.set_bus_mute(MUSIC_BUS, value < 0.05)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		pause_menu.visible = !pause_menu.visible
		
func hide_pause_menu() -> void:
	pause_menu.visible = false

func _on_masterslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(MASTER_BUS, linear_to_db(value))
	AudioServer.set_bus_mute(MASTER_BUS, value < 0.05)

func _on_quit_button_pressed() -> void:
	get_tree().quit()
	
	
func _on_main_menu_start_game() -> void:
	start_game.emit()
