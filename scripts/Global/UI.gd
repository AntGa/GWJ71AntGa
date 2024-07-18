extends CanvasLayer
class_name UI

signal start_game()

@onready var SFX_BUS = AudioServer.get_bus_index("SFX")
@onready var MUSIC_BUS = AudioServer.get_bus_index("MUSIC")
@onready var MASTER_BUS = AudioServer.get_bus_index("Master")
@onready var pause_menu: Control = $PauseMenu
@onready var main_menu: Control = $MainMenu
@onready var masterslider: HSlider = $PauseMenu/MarginContainer/VBoxContainer/GridContainer/MASTERSLIDER
@onready var sfxslider: HSlider = $PauseMenu/MarginContainer/VBoxContainer/GridContainer/SFXSLIDER
@onready var musicslider: HSlider = $PauseMenu/MarginContainer/VBoxContainer/GridContainer/MUSICSLIDER
@onready var start_button: Button = $MainMenu/MarginContainer/VBoxContainer/ButtonsVbox/Start
@onready var settings_grid_container: GridContainer = $PauseMenu/MarginContainer/VBoxContainer/GridContainer
@onready var main_menu_button: Button = $PauseMenu/MarginContainer/VBoxContainer/QuitButton



@export var action_items: Array[String]
func _ready() -> void:
	start_button.connect("pressed", _on_start_pressed)
	create_action_remap_items()

func _on_start_pressed() -> void:
	masterslider.value = db_to_linear(AudioServer.get_bus_volume_db(MASTER_BUS))
	sfxslider.value = db_to_linear(AudioServer.get_bus_volume_db(SFX_BUS))
	musicslider.value = db_to_linear(AudioServer.get_bus_volume_db(MUSIC_BUS))
	
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

func create_action_remap_items() -> void:
	var previous_item = settings_grid_container.get_child(settings_grid_container.get_child_count() - 1)
	for index in range(action_items.size()):
		var action = action_items[index]		
		var label = Label.new()
		label.text = action
		settings_grid_container.add_child(label)
		var button = RemapButton.new()
		button.action = action
		button.focus_neighbor_top = previous_item.get_path()
		previous_item.focus_neighbor_bottom = button.get_path()
		if index == action_items.size() - 1:
			main_menu_button.focus_neighbor_top = button.get_path()
			button.focus_neighbor_bottom = main_menu_button.get_path()
		previous_item = button

		settings_grid_container.add_child(button)
