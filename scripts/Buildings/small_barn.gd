extends Node2D

@onready var barn: TileMap = $Barn
@onready var animations: AnimationPlayer = $AnimationPlayer

var player_in_area : bool = false
var stop_looping_animation : bool = false

func _ready() -> void:
	pass
	
func _on_area_2d_body_entered(body) -> void:
	if body is Player:
		animations.play("BuildingFading")
		stop_looping_animation = false
		player_in_area = true

func _on_area_2d_body_exited(body) -> void:
	if body is Player:
		stop_looping_animation = true
		player_in_area = false

func _on_animation_player_animation_finished(anim_name) -> void:
	if !stop_looping_animation:
			animations.play("BuildingFading")
			
func _process(delta: float) -> void:
	if not player_in_area:
		return
		
	if Input.is_action_just_pressed("interact"):  # "ui_interact" should be mapped to the "e" key
		if GameManager.deduct_money(GameManager.upgrade_cost):
			GameManager.activate_upgrade()
			print("Upgrade purchased!")
