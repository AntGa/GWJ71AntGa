extends Control

signal start_game()
@onready var buttons_vbox: VBoxContainer = $MarginContainer/VBoxContainer/ButtonsVbox

func _on_start_game_button_pressed() -> void:
	start_game.emit()
	hide()
	
	
func _on_quit_button_pressed() -> void:
	get_tree().quit()

func
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
