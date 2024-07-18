extends Node

var money: int = 10
var time_passed: float = 0.0
var day_length: float = 300.0  # Length of a day in seconds (5 minutes)
var upgrade_active: bool = false
var upgrade_cost: int = 5
var money_generation_rate: float = 1.0  # Money per second when upgrade is active
var time_since_last_money_generation: float = 0.0
var pickaxe_power: int = 1

var lights_on_state = false

signal light_status(status: bool)


func _ready() -> void:
	light_status.emit(false)
	
	
func add_money(amount: int) -> void:
	money += amount
	print("Money:", money)
	
func deduct_money(amount: int) -> bool:
	if money >= amount:
		money -= amount
		return true
	else:
		return false

# Updates the time system and handles money generation
func _process(delta: float) -> void:
	time_passed += delta
	
	if time_passed >= day_length:
		time_passed = 0.0
		on_new_day()
	#print("Time Passed:", time_passed)
	update_lights()
	
	# Generate money automatically if upgrade is active
	if upgrade_active:
		time_since_last_money_generation += delta
		if time_since_last_money_generation >= 1.0:  # Check every second
			add_money(1)  # Increase money
			time_since_last_money_generation = 0.0  # Reset timer

func update_lights() -> void:
	if time_passed > 5 and !lights_on_state:
		light_status.emit(true)
		lights_on_state = true
	elif time_passed <= 5 and lights_on_state:
		emit_signal("lights_off")
		light_status.emit(false)
		
# Handles the transition to a new day
func on_new_day() -> void:
	print("A new day has begun!")
	
func activate_upgrade() -> void:
	if !upgrade_active:
		upgrade_active = true
		print("Automatic money generation activated!")

