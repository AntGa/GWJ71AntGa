extends Interactable

@onready var barn: TileMap = $Barn
@onready var animations: AnimationPlayer = $AnimationPlayer
@onready var PhysicsBarn: Node2D = $PhysicsBarn
@onready var particles: CPUParticles2D = $Particles
@onready var container: Control = $Container
@onready var label: Label = $Container/CenterContainer/Label


var player_in_area : bool = false
var stop_looping_animation : bool = false
var bought : bool = false

func _ready() -> void:
	Interact_UI = container
	PhysicsBarn.visible = false
	PhysicsBarn.get_node("TileMap").set_layer_enabled(0, false)
	particles.visible = false
	particles.emitting = false
	label.text = "Buy barn for $" + str(GameManager.upgrade_cost)
	hide_interact()
	
func _on_area_2d_body_entered(body) -> void:
	if body is Player and !bought :
		animations.play("BuildingFading")
		stop_looping_animation = false
		player_in_area = true
		show_interact()

func _on_area_2d_body_exited(body) -> void:
	if body is Player:
		stop_looping_animation = true
		player_in_area = false
		hide_interact()

func _on_animation_player_animation_finished(anim_name) -> void:
	if !stop_looping_animation:
		animations.play("BuildingFading")
			
func _process(delta: float) -> void:
	if not player_in_area or bought:
		return
		
	if Input.is_action_just_pressed("interact"):  # "ui_interact" should be mapped to the "e" key
		if GameManager.deduct_money(GameManager.upgrade_cost):
			GameManager.activate_upgrade()
			bought = true
			print("Upgrade purchased!")
			PhysicsBarn.visible = true
			PhysicsBarn.get_node("TileMap").set_layer_enabled(0, true)
			animations.play("Partcles")
			hide_interact()
	
	
