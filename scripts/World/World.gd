extends Node2D
@onready var time_label: Label = $UI/TimeLabel
@onready var money_label: Label = $UI/MoneyLabel
@onready var canvas_modulate: CanvasModulate = $CanvasModulate

@export var day_length: float = 600.0  # Duration of a full day cycle in seconds
@export var night_color: Color = Color(0, 0, 0.1, 0.5)  # Color during the night
@export var day_color: Color = Color(1, 1, 1, 1) 

func _process(delta):
	# Get the time passed from GameManager
	var time_passed = GameManager.time_passed
	var day_length = GameManager.day_length

	# Calculate the remaining time in minutes and seconds
	var remaining_time = int(day_length - time_passed)
	var minutes = remaining_time / 60
	var seconds = remaining_time % 60

	# Update the label text
	time_label.text = str(minutes) + ":" + str(seconds)
	 # Update the money label text
	money_label.text = "Money: $" + str(GameManager.money)

	 # Update the canvas modulate color based on time of day
	#var t = time_passed / GameManager.day_length  # Normalized time of day [0, 1]
	#var modulate_color = day_color.lerp(night_color, sin(t * PI))
	#canvas_modulate.color = modulate_color
