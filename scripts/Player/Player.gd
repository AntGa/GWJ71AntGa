extends CharacterBody2D
class_name Player


@onready var facing: String = "Right"
@onready var InAction: bool = false
@onready var weaponCollision = $Weapon/weaponArea/CollisionShape2D


