extends Node

var counter: int 
func _ready() -> void:
	counter = 0
	

func add_money() -> void:
	counter += 1

func _process(delta: float) -> void:
	pass
	
