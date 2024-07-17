extends Node2D

@onready var light = $PointLight2D
@onready var animation_player = $AnimationPlayer

func _ready():
	# Connect the lamp to the signals from the GameManager
	var game_manager = get_tree().root.get_node("GameManager")
	print(game_manager.name)
	game_manager.connect("light_status", _light_toggle)
	

func _light_toggle(light_status: bool):
	if light_status:
		animation_player.play("lamp_fade_in")
	else:
		print("jello")
		animation_player.play("lamp_fade_out")
