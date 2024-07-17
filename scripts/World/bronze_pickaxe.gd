extends Node2D
@export var upgrade_power: int = 1
@onready var collision: CollisionShape2D = $PurchaseArea/CollisionShape2D
@onready var animations: AnimationPlayer = $AnimationPlayer
var velocity: Vector2 = Vector2()

func _ready() -> void:
	await(get_tree().create_timer(1).timeout)
	collision.disabled = false
	

func _process(delta: float) -> void:
	position += velocity * delta
	velocity = velocity.lerp(Vector2(), 0.1) 
	
func _on_purchase_area_body_entered(body: Node2D) -> void:
	if body is Player:
		body.get_node("Weapon").upgrade_pickaxe_power(upgrade_power)
		collision.disabled = true
		animations.play("ItemDissapear")
		
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	self.queue_free()
