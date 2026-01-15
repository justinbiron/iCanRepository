extends CanvasLayer

@onready var heart_container = $HBoxContainer
var max_hearts = 5
var current_hearts = 5

# Textures for full and empty hearts
@export var full_heart_texture: Texture2D
@export var empty_heart_texture: Texture2D

func _ready():
	update_hearts()

func set_hearts(value: int):
	current_hearts = clamp(value, 0, max_hearts)
	update_hearts()

func update_hearts():
	var hearts = heart_container.get_children()
	
	for i in range(hearts.size()):
		if i < current_hearts:
			hearts[i].texture = full_heart_texture
		else:
			hearts[i].texture = empty_heart_texture

func take_damage(amount: int = 1):
	set_hearts(current_hearts - amount)

func heal(amount: int = 1):
	set_hearts(current_hearts + amount)

func get_current_hearts() -> int:
	return current_hearts

func is_dead() -> bool:
	return current_hearts <= 0
